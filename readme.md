<h1><strong>Football database</strong> <img class="alignleft" src="https://image.flaticon.com/icons/svg/27/27221.svg" alt="Football player attempting to kick ball free icon" width="40" height="40" /></h1>
&nbsp;

<a>The project was based on the creation of FIFA championship tables using the heidiSql program to manage the database.</a>

<img class="alignnone size-full wp-image-310" src="http://www.solocart.com.br/wp-content/uploads/2020/03/heidinovo.png" alt="" width="270" height="110" />
&nbsp;
<h2></a><strong>Prerequisites</strong></h2>
<ul style="list-style-type: disc;">
 	<li>Having installed heidiSq</li>
 	<li>in addition to having xamp or wampserver</li>
</ul>
<h3><a id="user-content-installing" class="anchor" href="https://github.com/gustavo910/ProjetoSqlFutebol#installing" aria-hidden="true"></a><strong>Installing</strong><img class="size-medium wp-image-298 alignright" src="http://www.solocart.com.br/wp-content/uploads/2020/03/xampwamp3-300x100.png" alt="" width="300" height="100" /></h3>
To open such a project it is necessary to activate xamp or wamp and open the damage database in the HeidiSql program as root and import the sql file or enter the query bar, paste the sql file and run it

&nbsp;
<h2 id="tw-target-text" class="tw-data-text tw-text-large tw-ta" dir="ltr" data-placeholder="Tradução"><strong><span lang="en">How to use and execute routines?</span></strong></h2>
Right click on the routine and select "run routine" in sequence will ask for your search parameter.

Example: run the buscaTime routine and set it to "barcelona" as parameter, so the data of the club entered will appear.

<img src="http://www.solocart.com.br/wp-content/uploads/2020/03/executar-rotina.jpg" alt="" width="258" height="294"/>  <img class="size-full" src="http://www.solocart.com.br/wp-content/uploads/2020/03/barcelona.jpg" alt="" width="" height="155" />
&nbsp;
&nbsp;
&nbsp;
<h3 dir="ltr" data-placeholder="Tradução"></h3>
<h3 id="tw-target-text" class="tw-data-text tw-text-large tw-ta" dir="ltr" data-placeholder="Tradução"><strong><span lang="en">Search Results</span></strong></h3>
<img class="alignnone wp-image-303 size-full" src="http://www.solocart.com.br/wp-content/uploads/2020/03/resultados.jpg" alt="" width="950" height="85" />
&nbsp;
&nbsp;
<h2>What is the trigger for in that database?<img class="alignleft" src="https://cdn.icon-icons.com/icons2/931/PNG/512/settings_icon-icons.com_72415.png" alt="ícone Ferramenta, ferramentas, configurações Livre de Mini Icon ..." width="58" height="58" /></h2>
<strong>Trigger delete_time:</strong> 
when you delete a team you will delete all players from that team on the table

<strong>Trigger SG:</strong>
will make the goal difference of the team in real time. That is when inserting a team will make the goals scored-goals conceded = goal difference
<strong>Trigger Suspenções:</strong>
when the user updates 3 yellow cards or 1 red card he will increase a suspension for that player.
