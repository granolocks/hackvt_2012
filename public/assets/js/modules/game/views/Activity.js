var ActivityView = Backbone.View.extend({
	className: "Activity-view accordion-group",

	initialize: function () {
        _.bindAll(this, 'rejectActivity', 'completeActivity');

		console.log('Activity - initialize()');
		
		this.model.bind('change', this.render, this);

        console.log(this.model.get('game'));
    },

    events: {
        "click .reject-activity"      : "rejectActivity",
        "click .complete-activity"    : "completeActivity",
    },

    completeActivity: function() {
        console.log('ActivityView - completeActivity()');

        this.model.set('complete', true);

        //$game = this.model.get('game');
        $.ajax({
          type: "POST",
          url: $app.base+'activity/complete/'+this.model.get('id'),
          success: function() {
            window.location = "/";
          }
        });

        //$app.navigate('reload/'+this.model.get('item_type'), true);
    },

    rejectActivity: function() {
        console.log('ActivityView - rejectActivity()')

        $game = this.model.get('game');
        $.ajax({
          type: "POST",
          url: $app.base+'activity/reject/'+this.model.get('id'),
          success: function() {
            window.location = "/";
          }
        });

        //$app.navigate('reload', true);

        return true;
    },

    render: function() {
    	console.log('Activity - render()');

    	$(this.el).html(ich.Activity(this.model.toJSON()));

        if(this.model.get('website') == null) {
            $(this.el).find('.website').remove();
        }

        return this;
    },
});	