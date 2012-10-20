class Wintermute < Sinatra::Base

  namespace "/api" do

    # We are going to return json for everything in this area.
    before do
      content_type "application/json"
    end

    namespace "/v1" do

      # Return the Entire Game Model
      get '/game/?' do
        login_required

        game_state.to_json
      end

      # Tell the backend user has consumed an inventory item to advance
      # Returns updated game state model
      put '/inventory/:inventory_type/?' do
        login_required

        current_user.complete_stop!(:inventory_type)

        # Return Game State
        game_state.to_json
      end

      # Tell the backend that the user has taken an action on the given acitvity
      # Possible actions include ‘complete’ or ‘reject’
      # Returns an updated game state model
      namespace '/activity' do

        # Mark activity as unwanted
        put '/reject/:activity_id/?' do
          login_required

          current_user.reject_activity(params[:activity_id])

          # Return Game State
          game_state.to_json
        end

        # Mark activity as complete
        # Increment inventory
        put '/complete/:id/?' do
          login_required

          # complete the activity
          current_user.complete_activity(params[:activity_id])

          # Return Game State
          game_state.to_json
        end

      end

      private
      def game_state
        {
          stop: current_user.current_stop.attributes,
          solutions: current_user.current_stop.solutions.map(&:attributes),
          inventory: current_user.inventory_counts,
          activities: current_user.suggestions.map(&:attributes)
        }
      end
    end
  end
end

