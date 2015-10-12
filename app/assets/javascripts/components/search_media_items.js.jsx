var SearchMediaItems = React.createClass({
  getInitialState: function() {
    return ({searchTerm: ''});
  },

  handleSearchInput: function(data) {
    this.setState({searchTerm: data.trim().toLowerCase()});
  },

  render: function() {
    var items = this.props.media_items;
    var searchTerm = this.state.searchTerm;

    if(!(searchTerm === 0)) {
      items = items.filter(function(i) {
        url_match = i.url.toLowerCase().match(searchTerm);
        title_match = false;
        if(i.scraped_title) {
          title_match = i.scraped_title.toLowerCase().match(searchTerm);
        }

        return url_match || title_match;
      });
    }

    return (
      <div>
        <SearchInput onEnter={this.handleSearchInput} />
        {items.map(function(item) {
          return <MediaItem key={item.id} item={item} />;
        })}

      </div>
    );
  }
});
