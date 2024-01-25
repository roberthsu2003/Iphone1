## MKMapView
- 2個重要的附屬套件
	- annotation
	- overlay
- MKMapView的樣式
	- standard
	- satellite
	- hybrid
- MKMapView的重要屬性
	- region

```
let loc = CLLocationCoordinate2DMake(34.927752,-120.217608)
let span = MKCoordinateSpan(latitudeDelta: 0.015, longitudeDelta: 0.015)
let reg = MKCoordinateRegion(center:loc, span:span)
self.map.region = reg
```

- span的另一種寫法(以公尺為單位的範圍)

```
let reg = MKCoordinateRegion(
        center:loc, latitudinalMeters:1200, longitudinalMeters:1200)
```

### Display a Region
- regin:MKCoordinateRegion
	- center:CLLocationCoordinate2D->提供一個坐標點
	- span:MKCoordinateSpan
- 以MKPointRect的範圍顯示整個地圖

```
let loc = CLLocationCoordinate2DMake(34.927752,-120.217608)
let pt = MKMapPoint(loc)
let w = MKMapPointsPerMeterAtLatitude(loc.latitude) * 1200
self.map.visibleMapRect =
        MKMapRect(x:pt.x - w/2.0, y:pt.y - w/2.0, width:w, height:w)

```

#### Scrolling and Zooming
- isZoomEnabled
- isScrollEnabled

## Annotation
1. attached to the MKMapView
	- any class that adopt MKAnnotation protocol. Which specifier a coordinate, a title, subtitle for the annotation
	- 也可以使用MKPointAnnotation class

```
let ann = MKPointAnnotation()
ann.coordinate = self.annloc
ann.title = "Park here"
ann.subtitle = "Fun awaits down the road!"
self.map.addAnnotation(ann)

```

2. Draws the annotation
	- 畫annotation is drawn by an MKAnnotationView,
	- 必需透過MKMapView的delegate
	- 如果沒有設定,會自動使用MKMarkerAnnotationView
