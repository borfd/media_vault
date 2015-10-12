var MediaItem = React.createClass({
  render: function() {
    return (
      <div>
        <a href="{this.props.item.url}">{this.props.item.url}</a>
      </div>
    );
  }
});
