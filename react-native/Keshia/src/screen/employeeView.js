/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */
import React from 'react';
import axios from 'axios';
import {
  StyleSheet,
  Image,
  View,
  Text,
  SafeAreaView,
  TouchableOpacity
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';
import { userRequest, userRequestType } from '@services/api';

class employeeView extends React.Component {
  constructor(props, context) {
    super(props, context);
    this.state = {
      queryUserData: '',
      loading: false,
    };
  } 

  getEmployee() {
    this.setState({
      loading: true,
    });
    console.log('getEmployee ')
    axios.post('http://10.107.14.6:8180/bi/phonebook/queryUser', {
      keyWord: "119831"
    }).then(res => {
      console.log("TCL: HomeView -> getRequestTyoe -> res", res);
      this.setState({
        queryUserData: res.data.list[0]
      })
    }).catch(error => {
      this.setState({
        loading: false,
        isRefresh: false,
      });
      if (!error.code && error.message === 'Network Error') {
        this.setState({
          errorType: 'NetworkError',
        });
      } else {
        this.setState({
          errorType: 'timeout',
        });
      }
    });
  }

  componentDidMount() {
    this.getEmployee();
  }


  render() {
    return (
      <LinearGradient colors={['#4c669f', '#3b5998', '#999']} style={{ flex: 1, }}>
        <SafeAreaView style={styles.mainView}>
          <View style={styles.headerView}>
            <TouchableOpacity style={{ paddingLeft: 12 }} onPress={() => this.props.navigation.pop()}>
              <Text style={styles.headerBackText}>Back</Text>
            </TouchableOpacity>
          </View>
          <View style={styles.detailView}>
            <Text style={styles.sectionTitle}>員工</Text>
            <Text style={[styles.detailTitleText, { marginBottom: 12 }]}>{this.state.queryUserData.staffCode}</Text>
            <View style={{ flexDirection: 'row', marginBottom: 12}}>
              <Text style={styles.detailTitleText}>{this.state.queryUserData.displayName}</Text>
            </View>
            <View style={{ flexDirection: 'row', marginBottom: 12 }}>
              <Text style={styles.detailTitleText}>{this.state.queryUserData.email}</Text>
            </View>
            <View style={{ flexDirection: 'row', marginBottom: 12 }}>
              <Text style={styles.detailTitleText}>{this.state.queryUserData.mobile}</Text>
            </View>
          </View>
        </SafeAreaView>
      </LinearGradient>
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
  headerView:{
    flexDirection: 'row',
  },
  headerBackText:{
    fontSize: 17,
    color:'#fff'
  },
  sectionTitle: {
    fontSize: 40,
    fontWeight: '600',
    color: "#fff",
    marginBottom:24,
    textAlign: 'left',
  },
  detailView:{
    marginTop:36,
    paddingHorizontal: 15,
  },
  detailTitleText:{
    fontSize: 20,
    color:'#fff',
    marginRight: 12,
  },
});

export default employeeView;
