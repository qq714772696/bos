<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理分区</title>
    <!-- 导入jquery核心类库 -->
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
    <!-- 导入easyui类库 -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/js/easyui/ext/portal.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/css/default.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/ext/jquery.portal.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath }/js/easyui/ext/jquery.cookie.js"></script>
    <script
            src="${pageContext.request.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"
            type="text/javascript"></script>
    <script type="text/javascript">
        function doAdd() {
            $('#addSubareaWindow').window("open");
        }

        function doEdit() {
            alert("修改...");
        }

        function doDelete() {
            alert("删除...");
        }

        function doSearch() {
            $('#searchWindow').window("open");
        }

        function doExport() {
            location.href="${pageContext.request.contextPath}/SubareaAction_exportToXls.action";
        }

        function doImport() {
            alert("导入");
        }

        //工具栏
        var toolbar = [{
            id: 'button-search',
            text: '查询',
            iconCls: 'icon-search',
            handler: doSearch
        }, {
            id: 'button-add',
            text: '增加',
            iconCls: 'icon-add',
            handler: doAdd
        }, {
            id: 'button-edit',
            text: '修改',
            iconCls: 'icon-edit',
            handler: doEdit
        }, {
            id: 'button-delete',
            text: '删除',
            iconCls: 'icon-cancel',
            handler: doDelete
        }, {
            id: 'button-import',
            text: '导入',
            iconCls: 'icon-redo',
            handler: doImport
        }, {
            id: 'button-export',
            text: '导出',
            iconCls: 'icon-undo',
            handler: doExport
        }];
        // 定义列
        var columns = [[{
            field: 'id',
            checkbox: true,
        }, {
            field: 'showid',
            title: '分区编号',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.id;
            }
        }, {
            field: 'province',
            title: '省',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.region.province;
            }
        }, {
            field: 'city',
            title: '市',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.region.city;
            }
        }, {
            field: 'district',
            title: '区',
            width: 120,
            align: 'center',
            formatter: function (data, row, index) {
                return row.region.district;
            }
        }, {
            field: 'addresskey',
            title: '关键字',
            width: 120,
            align: 'center'
        }, {
            field: 'startnum',
            title: '起始号',
            width: 100,
            align: 'center'
        }, {
            field: 'endnum',
            title: '终止号',
            width: 100,
            align: 'center'
        }, {
            field: 'single',
            title: '单双号',
            width: 100,
            align: 'center'
        }, {
            field: 'position',
            title: '位置',
            width: 200,
            align: 'center'
        }]];

        $(function () {
            // 先将body隐藏，再显示，不会出现页面刷新效果
            $("body").css({visibility: "visible"});

            // 收派标准数据表格
            $('#grid').datagrid({
                iconCls: 'icon-forward',
                fit: true,
                border: true,
                rownumbers: true,
                striped: true,
                pageList: [30, 50, 100],
                pagination: true,
                toolbar: toolbar,
                url: "${pageContext.request.contextPath}/SubareaAction_findByPaginationWithCondition.action",
                idField: 'id',
                columns: columns,
                onDblClickRow: doDblClickRow
            });
            //点击保存按钮
            $("#addSave").click(function () {
                if ($("#addForm").form("validate")) {
                    $("#addForm").submit();
                }
            });
            // 添加分区
            $('#addSubareaWindow').window({
                title: '添加分区',
                width: 600,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });
            // 修改分区
            $('#editSubareaWindow').window({
                title: '修改分区',
                width: 600,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });
            // 查询分区
            $('#searchWindow').window({
                title: '查询分区',
                width: 400,
                modal: true,
                shadow: true,
                closed: true,
                height: 400,
                resizable: false
            });

            //搜索表单提交时触发
            $("#btn").click(function () {
                $("#grid").datagrid("load",
                    {
                        "region.city": $("#region_city").val(),
                        "region.district": $("#region_district").val(),
                        "region.province": $("#region_province").val(),
                        "addresskey":$("#addresskey").val()
                    }
                );
                $("#searchWindow").window("close");
            });

        });

        function doDblClickRow(rowIndex, rowData) {
            $("#editSubareaWindow").window("open");
            $("#editForm").form("load", rowData);
        }
    </script>
</head>
<body class="easyui-layout" style="visibility:hidden;">
<div region="center" border="false">
    <table id="grid"></table>
</div>
<!-- 添加分区 -->
<div class="easyui-window" title="分区添加" id="addSubareaWindow" collapsible="false" minimizable="false"
     maximizable="false" style="top:20px;left:200px">
    <div style="height:31px;overflow:hidden;" split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="addSave" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
        </div>
    </div>

    <div style="overflow:auto;padding:5px;" border="false">
        <form method="post" action="${pageContext.request.contextPath}/SubareaAction_add.action" id="addForm">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">分区信息</td>
                </tr>
                <tr>
                    <td>选择区域</td>
                    <td>
                        <input class="easyui-combobox" name="region.id"
                               data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/RegionAction_listByCondition.action',mode:'remote'"/>
                    </td>
                </tr>
                <tr>
                    <td>关键字</td>
                    <td><input type="text" name="addresskey" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>起始号</td>
                    <td><input type="text" name="startnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>终止号</td>
                    <td><input type="text" name="endnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>单双号</td>
                    <td>
                        <select class="easyui-combobox" name="single" style="width:150px;">
                            <option value="0">单双号</option>
                            <option value="1">单号</option>
                            <option value="2">双号</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>位置信息</td>
                    <td><input type="text" name="position" class="easyui-validatebox" required="true"
                               style="width:250px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<!-- 修改分区 -->
<div class="easyui-window" title="分区修改" id="editSubareaWindow" collapsible="false" minimizable="false"
     maximizable="false" style="top:20px;left:200px">
    <div style="height:31px;overflow:hidden;" split="false" border="false">
        <div class="datagrid-toolbar">
            <a id="editSave" icon="icon-save" href="#" class="easyui-linkbutton" plain="true">保存</a>
        </div>
    </div>

    <div style="overflow:auto;padding:5px;" border="false">
        <form method="post" action="${pageContext.request.contextPath}/SubareaAction_add.action" id="editForm">
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">分区信息</td>
                </tr>
                <tr>
                    <td>选择区域</td>
                    <td>
                        <input class="easyui-combobox" name="region.id"
                               data-options="valueField:'id',textField:'name',url:'${pageContext.request.contextPath}/RegionAction_listByCondition.action',mode:'remote'"/>
                    </td>
                </tr>
                <tr>
                    <td>关键字</td>
                    <td><input type="text" name="addresskey" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>起始号</td>
                    <td><input type="text" name="startnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>终止号</td>
                    <td><input type="text" name="endnum" class="easyui-validatebox" required="true"/></td>
                </tr>
                <tr>
                    <td>单双号</td>
                    <td>
                        <select class="easyui-combobox" name="single" style="width:150px;">
                            <option value="0">单双号</option>
                            <option value="1">单号</option>
                            <option value="2">双号</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>位置信息</td>
                    <td><input type="text" name="position" class="easyui-validatebox" required="true"
                               style="width:250px;"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
<!-- 查询分区 -->
<div class="easyui-window" title="查询分区窗口" id="searchWindow" collapsible="false" minimizable="false" maximizable="false"
     style="top:20px;left:200px">
    <div style="overflow:auto;padding:5px;" border="false">
        <form>
            <table class="table-edit" width="80%" align="center">
                <tr class="title">
                    <td colspan="2">查询条件</td>
                </tr>
                <tr>
                    <td>省</td>
                    <td><input type="text" name="region.province" id="region_province"/></td>
                </tr>
                <tr>
                    <td>市</td>
                    <td><input type="text" name="region.city" id="region_city"/></td>
                </tr>
                <tr>
                    <td>区（县）</td>
                    <td><input type="text" name="region.district" id="region_district"/></td>
                </tr>
                <tr>
                    <td>关键字</td>
                    <td><input type="text" name="addresskey" id="addresskey"/></td>
                </tr>
                <tr>
                    <td colspan="2"><a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>