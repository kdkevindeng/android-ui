<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>换热站管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/admin/station/jobStation/">换热站列表</a></li>
		<shiro:hasPermission name="admin:station:jobStation:edit"><li><a href="${ctx}/admin/station/jobStation/form">换热站添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="jobStation" action="${ctx}/admin/station/jobStation/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="255" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>名称</th>
				<th>更新时间</th>
				<th>备注信息</th>
				<shiro:hasPermission name="admin:station:jobStation:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="jobStation">
			<tr>
				<td><a href="${ctx}/admin/station/jobStation/form?id=${jobStation.id}">
					${jobStation.name}
				</a></td>
				<td>
					<fmt:formatDate value="${jobStation.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${jobStation.remarks}
				</td>
				<shiro:hasPermission name="admin:station:jobStation:edit"><td>
    				<a href="${ctx}/admin/station/jobStation/form?id=${jobStation.id}">修改</a>
					<a href="${ctx}/admin/station/jobStation/delete?id=${jobStation.id}" onclick="return confirmx('确认要删除该换热站吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>