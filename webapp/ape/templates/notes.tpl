{capture name="title"}{$person->formatname('f m l')} ({$person->id}){/capture}
{box size="16" title="Manage Notes for <a href=\"`$PHP.BASE_URL`/user/`$person->pidm`\">`$smarty.capture.title`</a>"}
{if $action=="edit"}
{box size="8" title="Edit Note"}
<form action="{$PHP.BASE_URL}/user/{$person->pidm}/notes/change/{$note.id}" method="POST">
	<ul class="label-left">
		<li><label>Note:</label>
			<textarea cols=40 rows=5 name="note" placeholder="Enter note here">{$note.note}</textarea>
		</li>
		<li><label>Type:</label>
		{html_options name="status" options=$status_choices selected=$note.status}
		</li>
		<li><input type="Submit" class="btn btn-success" value="Edit Note"></li>
	</ul>
</form>

{/box}
{else}
{box size="8" title="New Note"}
<form action="{$PHP.BASE_URL}/user/{$person->pidm}/notes/add" method="POST">
	<ul class="label-left">
		<li><label>Note:</label>
			<textarea cols=40 rows=5 name="note" placeholder="Enter note here"></textarea>
		</li>
		<li><label>Type:</label>
		{html_options name="status" options=$status_choices}
		</li>
		<li><input type="Submit" class="btn btn-success" value="Add Note"></li>
	</ul>
</form>
{/box}
{/if}
{if $notes}
	<table class="table table-bordered table-striped">
		<thead>
			<th>Note ID</th>
			<th>Type</th>
			<th>Note</th>
			<th>Delete</th>
			<th>Edit</th>
		</thead>
		<tbody>
	{foreach from=$notes item=note key=id}
			<tr>
				<td>{$note.id}</td>
				<td>{$note.status}</td>
				<td>{$note.note}</td>
				<td><a href="{$PHP.BASE_URL}/user/{$person->pidm}/notes/delete/{$note.id}"><button class="btn btn-danger">Delete</button></a></td>
				<td><a href="{$PHP.BASE_URL}/user/{$person->pidm}/notes/edit/{$note.id}"><button class="btn btn-primary">Edit</button></a></td>
			</tr>
	{/foreach}
		</tbody>
	</table>

{/if}
{/box}
