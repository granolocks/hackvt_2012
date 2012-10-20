var InventoryItemView = Backbone.View.extend({
	className: "Inventory-view",

	initialize: function () {
		console.log('InventoryView - initialize()');
		
		this.model.bind('change', this.render, this);
    },

    render: function() {
    	console.log('InventoryView - render()');

    	$(this.el).html(ich.InventoryItem(this.model.toJSON()));

        return this;
    },
});	