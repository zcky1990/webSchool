Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Details = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-container-bayar",
	templateUrl : "../../template/details.tmp",
	onSuccessSignOut : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 


	initialize: function(config){
		this.spinnerController = config.spinnerController;
		this.cookiesController = config.cookiesController;
		this.requestAPI = config.requestAPI;
		this.data = config.response;
		console.log(this.data );
	},
	
	getIdFilterPembayaran : function(){
		return $('#tipe-pembayaran option:selected').val();
	},
	
	getSelectedFilterData : function(selctId){
		var filter = this.data.filter;
		var selectedFilter = {};
		for(var i = 0 ; i< filter.length; i++){
			var asd = filter[i];
			var id =  asd.id;
			if(id == selctId){
				selectedFilter = asd;
				break;
			}
		}
		return selectedFilter;
	},
	
	addPembayaran : function(selectedFilter){
		var besaran = selectedFilter.besaran;
		var id = selectedFilter.id;
		var deskripsi = selectedFilter.deskripsi;
		var template = this.getListTemplate(id, besaran, deskripsi);
		$('.list-bayar-container').append(template);
		$('#'+id+'-payment-btn').on('click', function(){
			$(this).parent().remove();
		})
	},
	
	getListTemplate : function(id, besaran, deskripsi){
		var html = "<div id='"+id+"-payment' class='bayar-list row'>" +
				"<label id="+deskripsi+" class='col-sm-3' >"+deskripsi+"</label>" +
				"<label id="+deskripsi+" class='col-sm-3' >Rp. "+besaran+"</label>" +
				"<input type='text' class='form-control col-sm-3' id='jumlahBayar'>"+
				"<button type='button' id='"+id+"-payment-btn' class='btn-payment col-sm-1 btn btn-primary orange-btn'>Remove</button>" +
				"</div>"
		return html;
	},
	
	bindUI : function (){
		var self = this;
		$('#addTipePembayaran').on('click',function(){
			var val = self.getIdFilterPembayaran();
			var selectedFilter = self.getSelectedFilterData(val);
			self.addPembayaran(selectedFilter);
		});
		
		$('#batal-bayar-angsuran').on('click',function(){
			$('.dialog-bayar-container').css('display','none');
		});
		
		$('#bayar-angsuran').on('click',function(){
			console.log('bayar');
		});
		
		$('.bayar-menu').on('click',function(){
			$('.details-form').css('display','none');
			$('.detail-menu').removeClass('active-tab');
			$('.bayar-menu').addClass('active-tab');
			$('.bayar-form').css('display','block');
			$('#bayar-angsuran').css('display','block');
		});
		
		$('.detail-menu').on('click',function(){
			$('.bayar-form').css('display','none');
			$('.bayar-menu').removeClass('active-tab');
			$('.detail-menu').addClass('active-tab');
			$('.details-form').css('display','block');
			$('#bayar-angsuran').css('display','none');
		});
	},
		
	setData: function(listSiswa){

	},
	
	postRender : function(){

	}
});