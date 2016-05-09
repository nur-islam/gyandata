$(function() {
   
   
   var o = { exec: function(p) {		
			var editorName = p.name,
				cacheId = "",
				nodeType = "",
				summarySheetExists = "",
				windowUrl = "",
				windowFeatures = "height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes",
				windowName = "imageUpload",
				uploadImageSource = $('#uploadImageSource').val(),
				contentId = $("#contentId").val();	
				windowUrl = "/jsp/ckeditor/imageEditorPopup.jsp?contentId="+contentId+"&editorName="+editorName;
			
			openWindow = window.open(windowUrl, windowName, windowFeatures);			
			openWindow.focus();
		}
	}

		CKEDITOR.plugins.add('imgupload', {
		init: function(editor) {
			editor.addCommand('imgupload', o);
			editor.ui.addButton('imgupload', {
				label: 'Image Upload',
				icon: this.path + 'icons.png',
				iconOffset:'36',
				command: 'imgupload'
			});		
			
			CKEDITOR.dialog.add( 'image', function(a){				
				return {
					  title : 'Test Dialog',
					  resizable : CKEDITOR.DIALOG_RESIZE_BOTH,
					  height : 0,
					  width : 0,
					  onLoad:function(){
						$("[name='customImgDiag']").parents(".cke_editor_assessmentEditor_dialog:eq(0)").addClass('hideDialog');
					  },
					  onShow:function(){
						$(".cke_1_dialog").hide();
						$("#che_dialog_cover_id").hide();
						var source = document.getElementById("source");
						if(source != null && source.value=="editPassage"){
							var contentId=document.getElementById("itemStemEditor").value;	openWindow=window.open("/pt/jsp/imageEditorPopup.jsp?contentId="+contentId+"&editorName="+editor.name,"myWindow","height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes");
						}
						else{
							var contentId=document.getElementById("itemStemEditor").value;	openWindow=window.open("/pt/jsp/imageEditorPopup.jsp?contentId="+contentId+"&editorName="+editor.name,"myWindow","height=400,width=600,status=yes,toolbar=no,menubar=no,location=no,scrollbars=yes");
						}
						openWindow.focus();
					  },
					  contents : [
						  {
							  id : 'customImgDiag',
							  label : 'First Tab',
							  title : 'First Tab Title',
							  accessKey : 'Q',
							  elements : [
								  {
									  type : 'text',
									  label : 'Test Text 1',
									  id : 'testText1',
									  'default' : 'hello world!'
								  }
							  ]
						   }
					  ]
				  };
			} ); 

		} 
	});	
  });