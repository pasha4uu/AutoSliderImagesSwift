//
//  ViewController.swift
//  AutoSliderImagesSwift
//
//  Created by PASHA on 06/02/19.
//  Copyright © 2019 Reatchall. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {

  @IBOutlet weak var sliderCV: UICollectionView!
  @IBOutlet weak var pageControl: UIPageControl!
  
  var timer = Timer()
  var counter = 0
  
  var imgArr = [  UIImage(named:"Alexandra Daddario"),
                  UIImage(named:"Angelina Jolie") ,
                  UIImage(named:"Anne Hathaway") ,
                  UIImage(named:"Dakota Johnson") ,
                  UIImage(named:"Emma Stone") ,
                  UIImage(named:"Emma Watson") ,
                  UIImage(named:"Halle Berry") ,
                  UIImage(named:"Jennifer Lawrence") ,
                  UIImage(named:"Jessica Alba") ,
                  UIImage(named:"Scarlett Johansson") ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    sliderCV.delegate = self
    sliderCV.dataSource = self
    pageControl.numberOfPages = imgArr.count
    pageControl.currentPage = 0
    DispatchQueue.main.async {
      self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector:#selector(self.changeImage), userInfo: nil, repeats: true)
    }
    // Do any additional setup after loading the view, typically from a nib.
  }

  @objc func changeImage() {
    if counter < imgArr.count {
      let index = IndexPath.init(item: counter, section: 0)
      sliderCV.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
      pageControl.currentPage = counter
      counter += 1
    }
    else
    {
      counter = 0
      let index = IndexPath.init(item: counter, section: 0)
      sliderCV.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
      pageControl.currentPage = counter
     counter = 1
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imgArr.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    if let imageV = cell.viewWithTag(222) as? UIImageView {
       imageV.image = imgArr[indexPath.row]
    }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let size = sliderCV.frame.size
    return CGSize(width: size.width, height: size.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0.0
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
