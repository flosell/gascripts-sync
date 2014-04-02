require "drive/sync/version"
require "drive/sync/script_project"
require "drive/sync/pull"

module Drive
  module Sync
    class Sync 
      def pull
        pull_command = Drive::Sync::Commands::PullCommand.new
        pull_command.run 
      end
    end
  end
end
