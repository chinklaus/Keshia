
import React from 'react';
import axios from 'axios';
import { StyleSheet } from 'react-native';
import { WebView } from 'react-native-webview';

class webview extends React.Component {
  render() {
    let webviewUrl = this.props.navigation.getParam('webviewUrl');
    return (
      <WebView source={{ uri: webviewUrl }} />
    );
  }
};

const styles = StyleSheet.create({
  mainView: {
    flex: 1,
    justifyContent: 'flex-start',
  },
  sectionTextView: {
    justifyContent: 'center'
  },
  headerView: {
    flexDirection: 'row',
  },
  headerBackText: {
    fontSize: 17,
    color: '#fff'
  },
  sectionTitle: {
    fontSize: 40,
    fontWeight: '600',
    color: "#fff",
    marginBottom: 24,
    textAlign: 'left',
  },
  detailView: {
    flex: 1,
    marginTop: 36,
    paddingHorizontal: 15,
    justifyContent: 'flex-start'
  },
  detailTitleText: {
    fontSize: 20,
    color: '#fff',
    marginRight: 12,
  },
  submitButtonView: {
    position: 'absolute',
    bottom: 0,
    marginBottom: 36,
    paddingHorizontal: 100,
    paddingVertical: 12,
    borderRadius: 12,
    backgroundColor: "#fff",
    alignItems: 'flex-end',
    alignSelf: 'center',
  }
});

export default webview;
