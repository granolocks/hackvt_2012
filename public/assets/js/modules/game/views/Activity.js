var ActivityView = Backbone.View.extend({
	className: "Activity-view accordion-group",

	initialize: function () {
		console.log('Activity - initialize()');
		
		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('Activity - render()');

    	$(this.el).html(ich.Activity(this.model.toJSON()));

        return this;
    },
});	