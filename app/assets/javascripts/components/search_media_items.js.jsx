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
        return i.url.toLowerCase().match(searchTerm);
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
