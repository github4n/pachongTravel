(function () {
    require.config({
        paths: {
            echarts: '../../../doc/example/www/js'
        },
        packages: [
            {
                name: 'BMap',
                location: '../src',
                main: 'main'
            }
        ]
    });

    require(
    [
        'echarts',
        'BMap',
        'echarts/chart/map'
    ],
    function (echarts, BMapExtension) {
        $('#main').css({
            height:$('body').height(),
            width: $('body').width()
        });

        // 初始化地图
        var BMapExt = new BMapExtension($('#main')[0], BMap, echarts,{
            enableMapClick: false
        });
        var map = BMapExt.getMap();
        var container = BMapExt.getEchartsContainer();

        var startPoint = {
            x: 121.67291404807811, 
            y: 31.14918372801515
        };

        var point = new BMap.Point(startPoint.x, startPoint.y);
        map.centerAndZoom(point, 16);
        map.enableScrollWheelZoom(true);
        // 地图自定义样式
        map.setMapStyle({
            styleJson: [
                  {
                       "featureType": "water",
                       "elementType": "all",
                       "stylers": {
                            "color": "#044161"
                       }
                  },
                  {
                       "featureType": "land",
                       "elementType": "all",
                       "stylers": {
                            "color": "#004981"
                       }
                  },
                  {
                       "featureType": "boundary",
                       "elementType": "geometry",
                       "stylers": {
                            "color": "#064f85"
                       }
                  },
                  {
                       "featureType": "railway",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "highway",
                       "elementType": "geometry",
                       "stylers": {
                            "color": "#004981"
                       }
                  },
                  {
                       "featureType": "highway",
                       "elementType": "geometry.fill",
                       "stylers": {
                            "color": "#005b96",
                            "lightness": 1
                       }
                  },
                  {
                       "featureType": "highway",
                       "elementType": "labels",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "arterial",
                       "elementType": "geometry",
                       "stylers": {
                            "color": "#004981"
                       }
                  },
                  {
                       "featureType": "arterial",
                       "elementType": "geometry.fill",
                       "stylers": {
                            "color": "#00508b"
                       }
                  },
                  {
                       "featureType": "poi",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "green",
                       "elementType": "all",
                       "stylers": {
                            "color": "#056197",
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "subway",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "manmade",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "local",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "arterial",
                       "elementType": "labels",
                       "stylers": {
                            "visibility": "off"
                       }
                  },
                  {
                       "featureType": "boundary",
                       "elementType": "geometry.fill",
                       "stylers": {
                            "color": "#029fd4"
                       }
                  },
                  {
                       "featureType": "building",
                       "elementType": "all",
                       "stylers": {
                            "color": "#1a5787"
                       }
                  },
                  {
                       "featureType": "label",
                       "elementType": "all",
                       "stylers": {
                            "visibility": "off"
                       }
                  }
            ]
        });

        option = {
            color: ['gold','aqua','lime'],
            title : {
                text: '模拟迁徙',
                subtext:'数据纯属虚构',
                x:'right'
            },
            tooltip : {
                trigger: 'item',
                formatter: function (v) {
                    return v[1].replace(':', ' > ');
                }
            },
            legend: {
                orient: 'vertical',
                x:'left',
                data:['薰衣草园', '生态园广场'],
                selectedMode: 'single',
                selected:{
                    '生态园广场' : false
                }
            },
            toolbox: {
                show : true,
                orient : 'vertical',
                x: 'right',
                y: 'center',
                feature : {
                    mark : {show: true},
                    dataView : {show: true, readOnly: false},
                    restore : {show: true},
                    saveAsImage : {show: true}
                }
            },
            dataRange: {
                min : 0,
                max : 100,
                y: '60%',
                calculable : true,
                color: ['#ff3333', 'orange', 'yellow','lime','aqua']
            },
            series : [
                {
                    name:'薰衣草园',
                    type:'map',
                    mapType: 'none',
                    data:[],
                    geoCoord: {
                        '薰衣草园': [121.670582,31.143744],
                        '邻家农庄': [121.67119,31.148966],
                      '迪艇皮划艇':[121.66516,31.149903],
                      '香草园入口':[121.6070058,31.144765],
                      '邻家烧烤':[121.664753,31.148645],
                      '香草园广场':[121.669708,31.1451],
                      '景观草坪':[121.670008,31.14166]
                    },
        
                    markLine : {
                        smooth:true,
                        effect : {
                            show: true,
                            scaleSize: 1,
                            period: 30,
                            color: '#fff',
                            shadowBlur: 10
                        },
                        itemStyle : {
                            normal: {
                                borderWidth:1,
                                lineStyle: {
                                    type: 'solid',
                                    shadowBlur: 10
                                }
                            }
                        },
                        data : [
                            [{name:'薰衣草园'}, {name:'迪艇皮划艇',value:90}],
                            [{name:'薰衣草园'}, {name:'景观草坪',value:80}],
                            [{name:'景观草坪'}, {name:'邻家农庄',value:70}],
                            [{name:'邻家烧烤'}, {name:'薰衣草园',value:60}],
                            [{name:'迪艇皮划艇'}, {name:'邻家烧烤',value:50}],
                            [{name:'邻家烧烤'}, {name:'迪艇皮划艇',value:40}],
                            [{name:'薰衣草园'}, {name:'香草园广场',value:10}],
                           [{name:'薰衣草园'}, {name:'邻家农庄',value:90}]
                        ]
                    },
                    markPoint : {
                        symbol:'emptyCircle',
                        symbolSize : function (v){
                            return 10 + v/10
                        },
                        effect : {
                            show: true,
                            shadowBlur : 0
                        },
                        itemStyle:{
                            normal:{
                                label:{show:false}
                            }
                        },
                        data : [
                            {name:'薰衣草园',value:90},
                            {name:'迪艇皮划艇',value:80},
                            {name:'香草园入口',value:70},
                            {name:'邻家农庄',value:60},
                            {name:'邻家烧烤',value:50},
                            {name:'香草园广场',value:40},
                          {name:'景观草坪',value:30}
                        ]
                    }
                    
                },
              
               
                
            ]
        };

        var myChart = BMapExt.initECharts(container);
        window.onresize = myChart.onresize;
        BMapExt.setOption(option);
    }
);
})();