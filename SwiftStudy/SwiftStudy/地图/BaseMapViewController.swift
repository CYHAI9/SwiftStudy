//
//  BaseMapViewController.swift
//  SwiftStudy
//
//  Created by 陈海哥 on 2017/12/5.
//  Copyright © 2017年 陈海哥. All rights reserved.
//

import UIKit
import MapKit

class BaseMapViewController: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    var baseMapView = MKMapView()
    var cllocationManager:CLLocationManager!
    var alterView:UIAlertController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI() -> Void {
        
        baseMapView.frame = CGRect(origin:CGPoint(x: 0, y: 0), size:CGSize(width:self.view.frame.size.width,height:self.view.frame.size.height))
        baseMapView.showsUserLocation = true
        baseMapView.showsPointsOfInterest = true
        self.view.addSubview(baseMapView)
        baseMapView.mapType = .standard
        baseMapView.showsScale = true
        baseMapView.delegate = self
        baseMapView.userTrackingMode = .follow
        cllocationManager = CLLocationManager.init()
        cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
        cllocationManager.distanceFilter = 20.0
        cllocationManager.pausesLocationUpdatesAutomatically = true
        cllocationManager.delegate = self;
        cllocationManager.startUpdatingLocation()
        cllocationManager.requestWhenInUseAuthorization()
        
        let span = MKCoordinateSpanMake(0, 0);
        self.baseMapView.setRegion(MKCoordinateRegionMake(baseMapView.userLocation.coordinate, span), animated: true)
        addAnnotation()
    }
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("地图加载完成")
    }
    
    func mapViewWillStartLoadingMap(_ mapView: MKMapView) {
        print("地图将开始加载")
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MKMapView) {
        print("地图用户定位开始")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MKMapView) {
        print("地图用户定位已经停止")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MKMapView, withError error: Error) {
        print("地图加载失败")
    }
    func mapView(_ mapView: MKMapView, didFailToLocateUserWithError error: Error) {
        print("地图定位失败")
    }
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        print("添加符号协议方法")
    }
    
    func mapView(_ mapView: MKMapView, didChange mode: MKUserTrackingMode, animated: Bool) {
        print("改变用户定位显示方式")
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let annotationView = view;
        annotationView.canShowCallout = true
        if ((annotationView.annotation?.isKind(of: MKUserLocation.self))! == false) {
            let rightButton = UIButton.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 50, height: 40)))
            rightButton.backgroundColor = UIColor.gray
            rightButton.setTitle("详情", for: .normal)
            annotationView.rightCalloutAccessoryView = rightButton as UIView
//            annotationView.leftCalloutAccessoryView = 
        }
        
        print("选择了某个符号")
        
    }
    func mapView(_ mapView: MKMapView, didAdd renderers: [MKOverlayRenderer]) {
        print("添加渲染层协议方法")
    }
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        
        let overlayRenderer = MKOverlayRenderer.init(overlay: overlay)
        print("返回渲染层协议方法")

        return overlayRenderer
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if (annotation.isKind(of: MKUserLocation.self)) {
            return nil
        }
        else{
            let annotationView = MKAnnotationView()
            annotationView.image = UIImage.init(named: "通用图标.jpg")
            print("返回一个符号协议方法")
            annotationView.canShowCallout = true
            annotationView.annotation = annotation
            let rightButton = UIButton.init(frame: CGRect.init(origin: CGPoint.init(x: 0, y: 0), size: CGSize.init(width: 50, height: 40)))
            rightButton.backgroundColor = UIColor.gray
            rightButton.setTitle("详情", for: .normal)
            return annotationView
       
        }
        
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("某一天，我开始\(String(describing: view.annotation?.title))\(String(describing: view.annotation?.coordinate))")
        
        let action = UIAlertAction.init(title: "删除", style:.default) { (alAction) in
        
        }
        let action02 = UIAlertAction.init(title: "取消", style:.default) { (alAction) in
            //do something
        }
        if (alterView == nil) {
            
            alterView = UIAlertController.init(title: "是否移除符号", message: nil, preferredStyle: .alert)
            alterView.addAction(action)
            alterView.addAction(action02)

        }
        
        self.present(alterView, animated: true) {
            //do something
        }
    }

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationViewDragState, fromOldState oldState: MKAnnotationViewDragState) {
//        print("某一天，我开始")

    }
    
    //TODO:CLLocationManagerDelegate
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("cllocation定位失败")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("cllocation定位更新")
    }
    
    func addAnnotation() -> Void {
        
        let longPress = UILongPressGestureRecognizer()
        longPress.addTarget(self, action:#selector(longPressAddAn(Press:)))
        self.baseMapView.addGestureRecognizer(longPress)
        
    }
    @objc func longPressAddAn(Press:UILongPressGestureRecognizer) -> Void {
        
        if (Press.state == .began) {

            let point = Press.location(in: self.view)
            let Coordinate:CLLocationCoordinate2D = baseMapView.convert(point, toCoordinateFrom: self.baseMapView)
            let annotion = Annotion()
            annotion.coordinate = Coordinate
            annotion.title = "标注"
            annotion.subtitle = "坐标\(Coordinate.latitude),\(Coordinate.longitude)"
            baseMapView.addAnnotation(annotion as MKAnnotation)
            
        }else if (Press.state == .ended){
            // do something
        }
        
        
    }
    
}

class Annotion:NSObject,MKAnnotation {
    var coordinate = CLLocationCoordinate2D()
    var title: String?
    var subtitle:String?
    
}


