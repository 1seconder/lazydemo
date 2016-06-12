//==========
$(function(){
		$('table.datatable').datatable({checkable: true, sortable: true});
		$('table.datatables').datatable({checkable: true});
});
//======富文本输入框======
    KindEditor.ready(function(K)
    {
      K.create('textarea.kindeditor',
      {
        allowFileManager : true,
        bodyClass : 'article-content',
        cssPath: '../dist/css/zui.css',
        afterBlur: function(){$('#content').prev('.ke-container').removeClass('focus');},
          afterFocus: function(){$('#content').prev('.ke-container').addClass('focus');}
      });

      K.create('textarea.kindeditorSimple',
      {
        bodyClass : 'article-content',
        cssPath: '../dist/css/zui.css',
        resizeType : 1,
        allowPreviewEmoticons : false,
        allowImageUpload : false,
        items : [
        'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
        'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
        'insertunorderedlist', '|', 'emoticons', 'image', 'link'],
        afterBlur: function(){$('#contentSimple').prev('.ke-container').removeClass('focus');},
          afterFocus: function(){$('#contentSimple').prev('.ke-container').addClass('focus');}
      });

      K.create('textarea.customStyle',
      {
        themeType : 'simple',
        bodyClass : 'article-content',
        cssPath: '../dist/css/zui.css',
        afterBlur: function(){$('#contentCustom').prev('.ke-container').removeClass('focus');},
          afterFocus: function(){$('#contentCustom').prev('.ke-container').addClass('focus');}
      });

    });