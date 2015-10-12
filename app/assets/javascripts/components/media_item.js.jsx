var MediaItem = React.createClass({
  render: function() {
    var title = this.props.item.url;
    var scrapedTitle = this.props.item.scraped_title;

    if(scrapedTitle && !(scrapedTitle.length === 0 || !scrapedTitle.trim())) {
      title = scrapedTitle;
    }
    return (
      <div>
        <a href="{this.props.item.url}">{title}</a>
      </div>
    );
  }
});
