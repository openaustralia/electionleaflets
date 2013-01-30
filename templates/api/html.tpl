<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>{$page_title|default:$site_tag_line} | {$site_name}</title>
	{literal}
		<style type="text/css">
			#straightchoice {
				width:140px;
				padding-bottom: 15px;
				padding-top: 4px;
				font-size:12px;
				font-family:arial, sans-serif;
			}
			#straightchoice ul {
				padding:0; margin:0;
			}
			#straightchoice li {
				padding:0 0 10px 0; margin-left:0;
				list-style-type:none;
			}
			#straightchoice .straightchoice_section {
				border-top-width: 1px;
				padding: 3px 0px 6px 0px;
				border-top-color: rgb(153, 153, 153);
			}
		</style>
	{/literal}
	</head>
	<body>
		<div id="straightchoice">
			<ul class="results">
				{if $has_leaflets}
					{foreach from="$leaflets" item="leaflet"}
						<li {if $is_geo}class="has_distance"{/if} class="straightchoice_section">
							<a class="leaflet" href="{$www_server}/leaflets/{$leaflet->leaflet_id}/">
								<img src="{image_url id=$leaflet->leaflet_image_image_key size=t}" alt="" />
							</a>
							<p>
								{if $method != 'party'}
									<a href="{$www_server}/parties/{$leaflet->party_url_id}/"><strong>{$leaflet->party_name}</strong>
									</a>
									uploaded {$leaflet->date_uploaded|date_format:"%A %e %B %Y"}
								{else}
									Uploaded {$leaflet->date_uploaded|date_format:"%A %e %B %Y"}
								{/if}
							</p>
						</li>
					{/foreach}
				{else}
					<li>
						<a class="leaflet" href="{$www_server}">
							<img src="{$www_server}/images/country.jpg" alt=""/>
						</a>
					</li>
				{/if}
			</ul>
			<p class="straightchoice_section">
				<a href="{$www_server}/addupload">Help {$site_name} monitor the campaign by uploading material you receive</a>
			</p>
			{if $has_leaflets}
				<p class="straightchoice_section">
					{if $method == 'constituency'}
						<a href="{$www_server}/{$area_names}/{$leaflets[0]->constituency_url_id}/">More campaign material from this area</a>
					{/if}
					{if $method == 'party'}
						<a href="{$www_server}/parties/{$leaflets[0]->party_url_id}/">More campaign material for the party</a>
					{/if}
					{if $method == 'latest'}
						<a href="{$www_server}/leaflets/">More latest campaign material</a>
					{/if}
				</p>
			{/if}
		</div>
		{literal}
        <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
        </script>
        <script type="text/javascript">
        try {
        var pageTracker = _gat._getTracker("{/literal}{$google_analytics_tracker}{literal}");
        pageTracker._trackPageview();
        } catch(err) {}</script>
        {/literal}
	</body>
</html>