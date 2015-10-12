var SearchMediaItems = React.createClass({
  handleSearchInput: function(data) {
    console.log(data);
  },

  render: function() {
    var items = this.props.media_items;

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
