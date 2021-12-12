module EverySoOften
  extend self

  private struct Done; end

  private def done
    Done.new
  end

  class TookTooLong < Exception
    def initialize(duration)
      super "action took longer than #{duration}"
    end
  end

  # Attempts to execute the given `action` every `duration`. If an `errors`
  # channel is specified, any exceptions raised by the specified action will be
  # sent to that channel; if not, the error is discarded. If `action` takes
  # longer than `duration` and `errors` is passed, a `TookTooLong` error is
  # passed to the channel; otherwise, the action is run again as soon as
  # possible.
  def every(duration : Time::Span, errors : Channel(Exception)? = nil, &action : -> Nil) : NoReturn
    loop do
      done_chan = Channel(Done).new
      start = Time.monotonic

      spawn do
        begin
          action.call
        rescue exception
          errors.try &.send exception
        ensure
          done_chan.send done unless done_chan.closed?
        end
      end

      done_chan.receive
      actual_duration = Time.monotonic - start
      if actual_duration > duration
        errors.try &.send TookTooLong.new duration
      else
        sleep duration - actual_duration
      end
    end
  end
end
