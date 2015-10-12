var SearchInput = React.createClass({
  getInitialState: function() {
    return ({value: ''});
  },
  handleChange: function(event) {
    this.setState({value: event.target.value});
  },

  onKeyDown: function(event) {
    this.props.onEnter(this.state.value);
  },

  render: function() {
    return (
      <input type="text" value={this.state.value} onChange={this.handleChange} onKeyDown={this.onKeyDown}/>
    );
  }
});
