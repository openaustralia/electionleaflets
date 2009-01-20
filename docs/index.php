<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">

<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>The Election Leaflet Project</title>
	<meta name="generator" content="TextMate http://macromates.com/">
	<meta name="author" content="Richard Pope">
    <link rel="stylesheet" href="css/main.css" type="text/css" media="screen" title="no title" charset="utf-8">
    <script src="javascript/main.js" type="text/javascript" charset="utf-8"></script>
    
</head>
<body>
    <div id="divPage">
        <div id="divHeader">
            <h1>The Election Leaflet Project</h1>
            <ul id="ulMenu">
                <li>
                    <a href="#">Add a leaflet</a>
                </li>
                <li>
                    <a href="#">Browse leaflets</a>
                </li>
                <li>
                    <a href="#">League tables</a>
                </li>                
                <li>
                    <a href="about.php">About</a>
                </li>                
            </ul>
        </div>
        <div id="divContent">
            <div id="divContentLeft">
                <form id="frmLeaflet" method="post" action="upload.php">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="uplFile">Upload an image *</label>
                                <input type="file" id="uplFile" name="uplFile" />
                            </li>
                            <li>
                                <label for="txtPostcode">Enter the post code the leaflet was delivered to *</label>
                                <input type="text" id="txtPostcode" name="txtPostcode" />
                                <small>this will let us work out which constituency the leaflet covers</small>
                            </li>
                            <li>
                                <label for="txtTitle">Give the leaflet a title *</label>
                                <input type="text" id="txtPostcode" name="txtPostcode" />
                                <small>e.g. the main headline</small>
                            </li>
                            <li>
                                <label for="txtDetail">Enter a general, impartial description of the leaflet</label>
                                <textarea type="text" id="txtDetail" name="txtDetail"></textarea>
                            </li>  
                            <li>
                                <label for="ddlElection">Which election(s) is this leaflet about? *</label>
                                <!--
                                    This needs to be genrated from a database.
                                    List of previous elections can be scraped form here: http://tinyurl.com/9b9ybv and future ones from here: http://tinyurl.com/a38anz Not sure what we do about by-elections.
                                    Choice should result in a flickr machine tag of electionleaflet:election=$id_from_database                                    
                                -->
                                <ul class="scroll">
                                    <li>
                                        <input type="checkbox" id="chkElection_european09" name="chkElection_european09" value="european09" />
                                        <label for="chkElection_european09">European Elections 2009</label>                                        
                                    </li>
                                    <li>
                                        <input type="checkbox" id="chkElection_englishlocal09" name="chkElection_local09" value=""/>
                                        <label for="chkElection_european09">Local Elections 2009</label>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <label for="ddlPartyBy">Which party is responsible for the leaflet? *</label>
                                <!-- 
                                    This needs to be generated from a database, with biggest 5 parties at the top.
                                    Data can be scraped from http://tinyurl.com/8wvlgs
                                    Choice should result in a flickr machine tag of electionleaflet:partyauthor=$id_from_database
                                -->
                                <select id="ddlPartyBy">
                                    <option></option>
                                    <option>Conservative And Unionist Party [The]</option>
                                    <option>Green Party [The]</option>
                                    <option>Labour Party [The]</option>
                                    <option>Liberal Democrats</option>
                                    <option>Scottish National Party	</option>
                                    <option>Plaid Cymru - Party of Wales [The]</option>
                                </select>
                            </li>
                            <li>
                                <label>Which parties (if any) does the leaflet attack or criticise?</label>
                                <ul class="scroll">
                                    <li>
                                        <input type="checkbox" />
                                        <label>Conservative And Unionist Party [The]</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" />
                                        <label>Green Party [The]</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" />
                                        <label>Labour Party [The]</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" />
                                        <label>Liberal Democrats</label>
                                    </li>
                                    <li>
                                        <input type="checkbox" />
                                        <label>Plaid Cymru - Party of Wales [The]</label>
                                    </li>
                                </ul>
                            </li>
                            <li>
                                <label for="txtCandidates">Enter the names of any candidates mentioned in the leaflet separated by commas</label>
                                <input type="text" id="txtCandidates" name=""/>
                            </li>
                            <li>
                                <label for="ddlCategory">What category best describes the content of this leaflet?</label>
                                <select>
                                    <option>General</option>                                                         
                                    <option>----------</option>                                     
                                    <option>Economy</option>
                                    <option>Environment</option>                                                                        
                                    <option>Foreign affairs</option>
                                    <option>Crime</option>
                                    <option>Immigration</option>                                                                        
                                    <option>Local issue or campaign</option>                                    
                                    <option>Tax</option>
                                    <option>Transport</option>
                                </select>
                            </li>
                            <li>
                                <label for="txtTags">Enter some extra tags to help describe this leaflet separated by commas</label>
                                <input type="text" id="txtCandidates" name=""/>
                                <small>e.g. the specific name of the issue or an town name it relates to</small>
                            </li>

                        </ul>
                    </fieldset>
                    <div>
                        <input type="button" onclick="javascript:upload();" value="Upload this leaflet"/>
                    </div>
                </form>
                <div id="divLoading">
                    <h3>Uploading this leaflet</h3>
                    <img src="images/loading.gif" alt="Uploading" title="Uploading"
                    <p>This may take a few moments</p>
                </div>
            </div>
            <div id="divContentRight">
                
            </div>
        </div>
        <div id="divFooter">
            
        </div>
    </div>
</body>
</html>
