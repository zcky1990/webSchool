
Clazz.PageWidget = Clazz.extend(Clazz.WidgetWithTemplate, {
	pageUrl: null,
	
	initialize : function(config) {
		this.pageUrl = config.pageUrl;
	},

	render : function(whereToRender) {
        var self = this;
		var iFrame =  $("<iframe src = '" + self.pageUrl + "' frameBorder='0' width='100%' height='100%'/>");

        $(whereToRender).append(iFrame);

        // iPhone5 retina screen doesn't exactly work with 100%!!!
        // retina detection
        var modern_media_query = window.matchMedia( "screen and (-webkit-min-device-pixel-ratio:2)");
		var er = new RegExp("iPhone","i");

        if( modern_media_query.matches && er.test(navigator.userAgent) ){
            // unfortunately, iPhone 5 size needs to be hardcoded...
            iFrame.css('height',"460px");
        }

        this.bindUI();
        this.doMore();
	}
});
