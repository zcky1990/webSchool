Clazz.createPackage("com.dewantara");

Clazz.com.dewantara.Dewantara = Clazz.extend(Clazz.WidgetWithTemplate, {
	defaultContainer : "overview\\:main-body-container",
	templateUrl : "../../template/mainPage.tmp",
	onSuccessSignOut : null,
	spinnerController: null,
	cookiesController: null,
	requestAPI: null, 
	filter : [],

	initialize: function(config){
		this.spinnerController = config.spinnerController;
		this.cookiesController = config.cookiesController;
		this.requestAPI = config.requestAPI;
		this.fitter = [];
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
				self.showDetails(row,response.details );
			}
		},function(errorResponse){
			self.spinnerController.hideSpinner();
		});
	},
	
	showDetails : function (row, detail){
		var response = detail[0];
		var ujian = response.ujian;
		var angsuran = response.angsuran;
		var string = this.getHeaderColumnChild(ujian);
		string = string + this.getDetailTable(ujian, angsuran);
		row.child(string).show();
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
			var desc = semester.description;
			dropdown = dropdown+"<option value="+start_end+">"+desc+"</option>";
		}
		dropdown = dropdown +"</select>";
		$( ".filter" ).append( dropdown );
	},
	
	postRender : function(){
		this.addFilterUI();
	},
	getHeaderColumnChild : function (ujian){
		var header = '<table>'
				+'<tbody>'
				+'<tr class="detail-table">'
				+'<td class="detail_title" colspan="16">'+$( ".filter option:selected" ).text()+'</td>'
				+'</tr>';
		var colNameTopHeader = '<tr><td rowspan="2">Gedung</td><td rowspan="2">Mpls</td>'
				+'<td rowspan="2">Seragam</td>'
				+'<td class="center-text" colspan="7">Beban '+$( ".filter option:selected" ).text() +'</td>'
				+'<td class="center-text" colspan="'+ujian.length+'">Ujian '+$( ".filter option:selected" ).text()+'</td>'
				+'<td rowspan="2" style="center-text">SPP</td>'
				+'<td rowspan="2" style="center-text">Angsuran '+$( ".filter option:selected" ).text()+'</td>'
				+'</tr>';
		var colNameBotHeader ='<tr>'
				+'<td>Praktek</td>'     
				+'<td>LKS</td>'
				+'<td>LKS Produktif</td>'
				+'<td>K-Pelajar</td>'
				+'<td>Kegiatan</td>'
				+'<td>Qurban</td>'
				+'<td>LDKS</td>';
		var colUjianHeader =''
			for(var i = 0 ; i < ujian.length; i++){
				var asd = ujian[i];
				colUjianHeader = colUjianHeader+'<td>'+asd.description+'</td>';
			}
			colUjianHeader = colUjianHeader+'</tr></tbody>';
		return header+colNameTopHeader+colNameBotHeader+colUjianHeader;
	},
	
	getDetailTable : function (ujian, angsuran){
		var total = 0;
		for (var k in angsuran) {
	        if (angsuran.hasOwnProperty(k)) {
	        		total = total + angsuran[k];
	        }
	    }
		var data ='	<tbody><tr>'
			+'<td>'+angsuran.gedung+'</td>'
			+'<td>'+angsuran.mpls+'</td>'
			+'<td>'+angsuran.seragam+'</td>'
			+'<td>'+angsuran.praktek+'</td>'
			+'<td>'+angsuran.lks+'</td>'
			+'<td>'+angsuran.lks_produktif+'</td>'
			+'<td>'+angsuran.kegiatan+'</td>'
			+'<td>'+angsuran.kartu_pelajar+'</td>'
			+'<td>'+angsuran.qurban+'</td>'
			+'<td>'+angsuran.ldks+'</td>';
		for(var i = 0 ; i < ujian.length; i++){
			var asd = ujian[i];
			data = data+'<td>'+asd.sisa+'</td>';
			total = total+ asd.sisa;
		}
		data = data	+'<td>'+angsuran.spp+'</td><td>'+total+'</td></tr></tbody></table>';
		return  data;
	}
});
