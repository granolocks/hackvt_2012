class Wintermute < Sinatra::Base

  namespace "/api" do

    # We are going to return json for everything in this area.
    before do
      content_type "application/json"
    end

    namespace "/v1" do

      # Return the Entire Game Model
      get '/game/?' do
        game_state.to_json
      end

      # Tell the backend user has consumed an inventory item to advance
      # Returns updated game state model
      put '/inventory/?' do

        current_user.complete_stop!(params[:solution_id])

        # Return Game State
        game_state.to_json
      end

      # Tell the backend that the user has taken an action on the given acitvity
      # Possible actions include ‘complete’ or ‘reject’
      # Returns an updated game state model
      namepspace '/activity' do

        # Mark activity as unwanted
        put '/reject/:activity_id/?' do

          current_user.reject_activity(params[:activity_id])

          # Return Game State
          game_state.to_json
        end

        # Mark activity as complete
        # Increment inventory
        put '/complete/:id/?' do

          # complete the activity
          current_user.complete_activity(params[:activity_id])

          # Return Game State
          game_state.to_json
        end

      end

      private
      def game_state
        {
          stop: current_user.current_stop,
          solutions: current_user.current_stop.solutions,
          inventory: current_user.inventory,
          activities: current_user.suggestions
        }
      end
    end
  end
end

