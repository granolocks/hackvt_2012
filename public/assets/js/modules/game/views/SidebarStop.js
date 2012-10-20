var SidebarStopView = Backbone.View.extend({
	className: "SidebarStop-view",

	initialize: function () {
		console.log('SidebarStopView - initialize()');
		console.log('SidebarStopView - Stop Model...');
		console.log(this.model.toJSON());

		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('SidebarStopView - render()');

    	$(this.el).html(ich.SidebarStop(this.model.toJSON()));

        return this;
    },
});	