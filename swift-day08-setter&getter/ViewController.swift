//
//  ViewController.swift
//  swift-day08-setter&getter
//
//  Created by 万安 on 16/4/28.
//  Copyright © 2016年 penglei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        class MyCirle{
            var r:Double
            
            init(){
                r = 3.0;
            
            }
            //获取面积
            func getArea() ->Double{
            
                return 3.34*r*r;
            }
            var s:Double{
                //这里的get 和 set 方法 和oc 的是不一样的
                //getter方法 用于计算属性  不能存储数据的 用于计算一个值的
                get{
                
                    return 3.14*r*r;
                
                }
                //传入一个面积求半径
                set (newArea){//可以设置参数 也可以不设置 不设置参数 那么默认会传进来一个newValue
                 self.r = sqrt(newArea/3.14)
                
                }
//                set {//这就是没有设置参数
//                    self.r = sqrt(newValue/3.14)
//                    
//                }

            
            
            }
        
        }
        var cirl = MyCirle()
        
        print(cirl.getArea())//调用的方法 得到面积
        
        print(cirl.s) //可以使用. 来获取面积 这里内部会调用get 方法 没有显示调用方法
        
        //设置 一个面积  根据面积 内部 会计算出 半径的值
        cirl.s = 314
        //打印新的半径值
        print(cirl.r)
        //结构体中也有和类一样的get 和 set 计算属性,如下例子
        
        struct Point {
            var x = 0.0, y = 0.0
        }
        
        struct Size {
            var width = 0.0,height = 0.0
        }
        
        struct Rect {
            //创建一个对象
            var origin = Point()
            var size = Size ()
            
            //center 属性 计算属性  从 size 和 origin 计算出来
            //var center = 0.0;
            //center 不是用来存储的 是一个计算的
            
            var center :Point {
                //getter方法
                get{
                    let x = origin.x + (size.width/2)
                    let y = origin.y + (size.height/2)
                    return Point (x:x,y:y)
                }
                //setter函数  newCenter 是参数
                set(newCenter) {
                    //不写 newCenter 默认是 newValue
                    origin.x = newCenter.x + size.width/2
                    origin.y = newCenter.y + size.height/2
                }
            }
            
            func getCenter()->(Double,Double) {
                let x = origin.x + (size.width/2)
                let y = origin.y + (size.height/2)
                return (x,y)
            }
        }
        
        
        var rect = Rect (origin: Point(x: 100, y: 200), size:Size(width: 400, height: 44))
        
        //显示调用函数
        var (x,y) = rect.getCenter()
        
        print("x:\(x),\(y)")
        
        
        //不需要显示调用函数 getter
        var p2 = rect.center
        print("x2:\(p2.x) y2:\(p2.y)")
        //不需要显示调用 函数 这样 比较方便 实际上 这里也是在调用函数
        rect.center = Point(x: 10000, y: 20000)
        
        print("x:\(rect.center.x)")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

