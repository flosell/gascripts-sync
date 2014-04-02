require "drive/sync/version"
require "drive/sync/script_project"
require "drive/sync/pull"
require "drive/sync/push"

module Drive
  module Sync
    class Sync 
      def pull
        pull_command = Drive::Sync::Commands::PullCommand.new
        pull_command.run 
      end

      def push
        command = Drive::Sync::Commands::PushCommand.new
        command.run 
      end
    end
  end
end
