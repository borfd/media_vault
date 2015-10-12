var MediaItemDangerousInnerHTML = React.createClass({
  render: function() {
    return (
      <div className="panel">

        <div dangerouslySetInnerHTML={{__html: this.props.html}} />
        <p>Added on {this.props.createdAt}</p>
      </div>
    );
  },
});

var MediaItem = React.createClass({

  getInitialState: function() {
    return ({collapsed: true});
  },

  handleClick: function() {
    this.setState({collapsed: !this.state.collapsed});
  },

  render: function() {
    var title = this.props.item.url;
    var scrapedTitle = this.props.item.scraped_title;

    if(scrapedTitle && !(scrapedTitle.length === 0 || !scrapedTitle.trim())) {
      title = scrapedTitle;
    }
    return (
      <div className="media-item">
        <a onClick={this.handleClick}>{title}</a>
        {!this.state.collapsed ? <MediaItemDangerousInnerHTML html={this.props.item.url_html} createdAt={this.props.item.created_at} /> : ""}
      </div>
    );
  }
});
