<%--
  Created by IntelliJ IDEA.
  User: x3408
  Date: 2018/3/13
  Time: 22:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>kindeditor</title>
    <script src="js/jquery-1.8.3.js"></script>
    <script src="js/kindeditor-all-min.js"></script>
    <script src="kindeditor/lang/zh-CN.js"></script>
    <link rel="stylesheet" href="kindeditor/themes/default/default.css">
    <script type="text/javascript" >
        var editor;
        KindEditor.ready(function(k){
            k('input[name=content]').click(function(e){
                editor.sync();
            });
            editor=k.create('textarea[name="content"]',{
                allowFileManager:true,
                cssPath : 'kindeditor/plugins/code/prettify.css',
                uploadJson : 'KindEditorAction_uploadImg',//提交地址，action要自己配置
                fileManagerJson : 'kindeditor/jsp/file_manager_json.jsp',
                resizeType:0,
                urlType: 'domain',
                afterCreate : function() {
                    var self = this;
                    K.ctrl(document, 13, function() {
                        self.sync();
                        document.forms['content'].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function() {
                        self.sync();
                        document.forms['content'].submit();
                    });
                },
                afterCreate: function () {  //要取值设置这里 这个函数就是同步KindEditor的值到textarea文本框
                this.sync();
            },
            afterBlur: function () {  //同时设置这里
                this.sync();
            },
                items : ['source','fontname','fontsize','forecolor','preview','selectall','justifyleft','justifycenter','justifyright','emoticons','link','unlink','image'],
            });

            prettyPrint();


        })
    </script>
</head>
<body>
<form action="TopicAction_addTopic" method="post">
    <input type="text" name="title">
    <textarea id="editor_id" name="content"></textarea>
    <input type="submit" value="提交" name="test">
</form>
</body>
</html>