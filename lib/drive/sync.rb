require "drive/sync/version"
require "drive/sync/script_project"
require "drive/sync/pull"
require "drive/sync/push"
require "drive/sync/settings"


module Drive
  module Sync
    class Sync 
      def init
        Drive::Sync::Settings.load!
      end
      def tear_down
        Drive::Sync::Settings.save!
      end

      def pull
        init 

        pull_command = Drive::Sync::Commands::PullCommand.new
        pull_command.run 

        tear_down
      end

      def push
        init 

        command = Drive::Sync::Commands::PushCommand.new
        command.run 

        tear_down
      end
    end
  end
end
