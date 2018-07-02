Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Dewantara = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-body-container",
	templateUrl : "../../template/mainPage.tmp",
	onSuccessSignOut : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 
	filter : [],
	siswaResponse : {},

	initialize: function(config){
		this.spinnerController = config.spinnerController;
		this.cookiesController = config.cookiesController;
		this.requestAPI = config.requestAPI;
		this.fitter = [];
		this.siswaResponse = {};
	},
	
	bindUI : function (){
		var self= this;
		var table =  $('#list-siswa').DataTable({
			 "columnDefs": [
		            {
		                "targets": [ 3 ],
		                "visible": false,
		                "searchable": false
		            }
		        ]
		 });
		
		$('.details-btn').on('click',function(){
			 var tr = $(this).closest('tr');
			 var row = table.row( tr );
			 if(tr.hasClass('show-details')){
				 tr.removeClass('show-details');
				 row.child().hide();
			 }else {
				 tr.addClass('show-details');
				 var nisn = row.data()[0];
				 var kelasId = row.data()[3];
				 var model = {};
				 var date = $( ".filter option:selected" ).val();
				 var values=date.split('-');
				 model.nisn = nisn;
				 model.kelas = kelasId;
				 model.startMonth = values[0];
				 model.endMonth = values[1];
				 self.getPaymentDetails(model, row);
			 }
		});
	},
	
	getPaymentDetails: function (model, row){
		var self = this;
		self.spinnerController.showSpinner();
		var username = self.cookiesController.getCookie('username');
		var filter = self.filter;
		self.requestAPI.request('/getAngsuran',"POST",JSON.stringify(model) , function(response){
			self.spinnerController.hideSpinner();
			if(response.status == 'success'){
				model.detail = response.details.detail;
				model.filter = response.angsuran_filter;
				self.siswaResponse = model;
				self.showDetails(model, row,response.details);
			}
		},function(errorResponse){
			self.spinnerController.hideSpinner();
		});
	},
	
	showDetails : function (model, row, details){
		var self = this;
		var val =  model.nisn +"-"+model.kela+"-"+ model.startMonth+"-"+model.endMonth;
		var summary = details.summary;
		var string = this.getHeaderColumn(summary);
		string = string + this.getDetailTable(summary);
		string = string +"<button type='button' value = '"+val+"'class='btn btn-warning pay'>Bayar</button>";
		row.child(string).show();
		
		$('.pay').on('click', function(){
			var details = new Clazz.com.dewantara.Details({
				'spinnerController' : self.spinnerController,
				'cookiesController' : self.cookiesController,
				'requestAPI' : self.requestAPI,
				'response' : self.siswaResponse
			});
			details.render();
		});
	},
	
	showPage : function(){
		$('.home-page').removeClass('hide');
		$('.home-page').addClass('show');
	},
	
	hidePage : function(){
		$('.home-page').removeClass('show');
		$('.home-page').addClass('hide');
	},
	
	setData: function(listSiswa){
		this.data.ListSiswa = listSiswa;
	},
	
	setFilter : function(filter){
		this.filter = filter;
	},
	
	addFilterUI : function(){
		var dropdown = "Semester : <select class='semester'>";
		var dropdownFilter = this.filter;
		for(var i = 0 ;i < dropdownFilter.length; i++){
			var semester = dropdownFilter[i];
			var start_end = semester.start_semester+"-"+semester.end_semester;
			var desc = semester.deskripsi;
			dropdown = dropdown+"<option value="+start_end+">"+desc+"</option>";
		}
		dropdown = dropdown +"</select>";
		$( ".filter" ).append( dropdown );
	},
	
	postRender : function(){
		this.addFilterUI();
	},
	getHeaderColumn : function (detail){
		var header = '<table class="detail-angsuran-siswa">'
				+'<tbody>'
				+'<tr class="detail-table">'
				+'<td class="detail_title" colspan="16">'+$( ".filter option:selected" ).text()+'</td>'
				+'</tr>';
		
		var colNameBotHeader ='<tr class="column-name">'
			for(var i = 0; i< detail.length; i++){
				colNameBotHeader = colNameBotHeader+'<td>'+(detail[i].type_desc).toUpperCase()+'</td>';
			}
		colNameBotHeader =colNameBotHeader+'<td>Sisa Angsuran Harus Dibayar</td></tr></tbody>';
		return header+colNameBotHeader;
	},
	
	getDetailTable : function (detail){
		var total = 0;
		var data ='	<tbody><tr class="angsuran-need">'
		for (var i = 0 ; i < detail.length; i ++) {
	        var asd = detail[i];
	        total = total + asd.sisa_angs;
	        data = data	+'<td>'+asd.sisa_angs+'</td>'
	    }
		data = data	+'<td>'+total+'</td>'+'</tr></tbody></table>';
		return  data;
	}
});
