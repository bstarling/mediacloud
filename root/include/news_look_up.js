
function yql_lookup(query, cb_function, cb_error) {
    var url = 'http://query.yahooapis.com/v1/public/yql?q=' + encodeURIComponent(query) + '&format=json&diagnostics=true';

    //alert(url);

    //See http://blueonionsoftware.com/blog.aspx?p=03aff202-4198-4606-b9d6-686fd13697ee
    jQuery.support.cors = true; // force cross-site scripting (as of jQuery 1.5)
    $.ajax({
  url: url,
		crossDomain: true,
  dataType: 'jsonp',
 success: cb_function,
 error: cb_error
});
    // $.getJSON(url, cb_function);
}

function look_up_news() {

    // TEMPORARY HACK
    //mediacloud.org is password protected so we can't pull from it directly
    // instead we pull from 'https://blogs.law.harvard.edu/mediacloud2/feed/' and dynamically rewrite the URLs to point to mediacloud.org/blog;
    var feed_url = 'https://blogs.law.harvard.edu/mediacloud2/feed/';

    //alert(google_url);
    $('#news_items').html('<p>Loading...</p>');
    yql_lookup("select * from rss where url = '" + feed_url + "'", function (response) {

        var results = response.query.results;

	var news_items = $('#news_items');

        //console.log(results);
        news_items.children().remove();
        news_items.html('');

        $.each(results.item, function (index, element) {
            var title = element.title;
            var link = element.link;

	    link = link.replace('https://blogs.law.harvard.edu/mediacloud2/', 'http://www.mediacloud.org/blog/');
            news_items.append($('<a/>', {
                'href': link
            }).text(title)).append('<br/>');
        });

	}, 
	function(jqXHR, textStatus, errorThrown)
	{
	var news_items = $('#news_items');

        //console.log(results);
        news_items.children().remove();
        news_items.html('');
        news_items.html(textStatus);
	
	}
);
}
