var MapView = Backbone.View.extend({
	className: "Map-view",

	initialize: function () {
		console.log('MapView - initialize()');
		console.log('MapView - Game Model...');
		console.log(this.model.toJSON());

		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('MapView - render()');

    	$(this.el).html(ich.Map(this.model.toJSON()));

        return this;
    },
});	