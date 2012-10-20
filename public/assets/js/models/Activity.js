var Activity = Backbone.Model.extend({
	defaults: {
		'id': '1',
		'name': 'This is an activity',
		'description': 'This is some shit you can do.',
		'address': '27 Can We Do It Lane',
		'website': 'http://doshitnow.com',
		'latitude': 44.4565676,
		'longitude': -74.23122,
		'item_type': 'weapon'
    },

    initialize: function () {
    } 
})

var ActivityCollection = Backbone.Collection.extend({
    model: Activity,

    initialize: function() {
    },
});