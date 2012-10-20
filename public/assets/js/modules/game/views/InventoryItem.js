var InventoryItemView = Backbone.View.extend({
	className: "Inventory-view",

	initialize: function () {
        _.bindAll(this, 'selectItem');

		console.log('InventoryView - initialize()');
		
		this.model.bind('change', this.render, this);
    },

    events: {
        "click .inventory-item-button"       : "selectItem",
    },

    selectItem: function() {
        console.log('InventoryItemView - selectItem()');

        return true;
    },

    render: function() {
    	console.log('InventoryView - render()');

    	$(this.el).html(ich.InventoryItem(this.model.toJSON()));

        return this;
    },
});	