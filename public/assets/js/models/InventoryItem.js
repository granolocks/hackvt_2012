var InventoryItem = Backbone.Model.extend({
	defaults: {
		'id': 'food',
		'count': 2,
    },

    initialize: function () {
    } 
})

var InventoryItemCollection = Backbone.Collection.extend({
    model: InventoryItem,

    initialize: function() {
    },
});