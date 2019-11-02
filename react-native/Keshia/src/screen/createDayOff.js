
import React from 'react';
import axios from 'axios';
import {
  StyleSheet,
  Picker,
  View,
  Text,
  SafeAreaView,
  TouchableOpacity,
  Button,
  Alert
} from 'react-native';
import LinearGradient from 'react-native-linear-gradient';

class createDayOff extends React.Component {
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
              <Text style={styles.sectionTitle}>請假單</Text>
              <Text style={styles.sectionTitle}>員工</Text>
              <Text style={[styles.detailTitleText, { marginBottom: 6 }]}>119831</Text>
              <View style={{ marginBottom: 12 }}>
                <Text style={styles.detailTitleText}>Eric Lai 賴宜賢</Text>
              </View>
              <View style={{ flexDirection: 'row',}}>
                <Text style={styles.detailTitleText}>日期起始</Text>
                <Text style={styles.detailTitleText}>2019/12/25</Text>
                <Text style={styles.detailTitleText}>到</Text>
                <Text style={styles.detailTitleText}>2019/12/27</Text>
              </View>
              <View style={{ marginBottom: 12 }}>
                <Picker
                  selectedValue={this.state.language}
                  itemStyle={color = '#fff'} 
                  style={{ height: 10, width: '100%', color:'#fff' }}
                  onValueChange={(itemValue, itemIndex) =>
                    this.setState({ language: itemValue })
                  }>
                  <Picker.Item color="#fff" label="事假" value="事假" />
                  <Picker.Item color="#fff" label="病假" value="病假" />
                  <Picker.Item color="#fff" label="指定假" value="指定假" />
                  <Picker.Item color="#fff" label="公假" value="公假" />
                  <Picker.Item color="#fff" label="年休假" value="年休假" />
                </Picker>
              </View>
            <View style={styles.submitButtonView}>
                <Button
                  style={{ textAlign: 'center',}}
                  title="確定請假"
                  color="#f194ff"
                onPress={() => 
                  Alert.alert(
                    '請假完成！',
                    '',
                    [
                      { text: '好', onPress: () => this.props.navigation.pop() },
                    ],
                    { cancelable: false },
                  )
                }
                />
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
    flex:1,
    marginTop: 36,
    paddingHorizontal: 15,
    justifyContent:'flex-start'
  },
  detailTitleText: {
    fontSize: 20,
    color: '#fff',
    marginRight: 12,
  },
  submitButtonView:{
    position:'absolute',
    bottom:0,
    marginBottom: 36,
    paddingHorizontal: 100,
    paddingVertical: 12,
    borderRadius: 12,
    backgroundColor: "#fff",
    alignItems: 'flex-end',
    alignSelf: 'center',
  }
});

export default createDayOff;
