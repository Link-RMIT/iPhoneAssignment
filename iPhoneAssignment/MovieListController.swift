//
//  MovieListController.swift
//  iPhoneAssignment
//
//  Created by Cookie on 16/3/25.
//  Copyright © 2016年 rmit. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON

class MovieListController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var movieList=MovieModel.movieList
    var filteredMovie=[Movie]()
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isAccessibilityElement=true;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.tableView.dataSource=self
        self.searchBar.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if( tableView == self.searchDisplayController?.searchResultsTableView){
            return self.filteredMovie.count
        }else{
            return self.movieList.count
        }
    }
/*
    func tableView(tableView: UITableView, canPerformAction action: Selector, forRowAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject)->Bool{
        let cell = tableView.dequeueReusableCellWithIdentifier("movieItem", forIndexPath: indexPath)
        
        // Configure the cell...
        let movie = movieList[indexPath.row]
        cell.textLabel!.text=movie.title
        cell.imageView!.image=UIImage(named:movie.poster)
        cell.detailTextLabel!.text=movie.year
        return cell
    }*/

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("movieItem", forIndexPath: indexPath)

        // Configure the cell...
        var movie : Movie
        if( tableView == self.searchDisplayController?.searchResultsTableView){
            movie = self.filteredMovie[indexPath.row]
        }else{
            movie = self.movieList[indexPath.row]
        }

        
        //movie = movieList[indexPath.row]
        cell.textLabel!.text=movie.title
        cell.imageView!.image=UIImage(named:movie.poster)
        cell.detailTextLabel!.text=movie.year
        return cell
    }
    //*/
    func filterContentForSearchText(searchText: String, scope: String = "Title"){
        self.filteredMovie = self.movieList.filter({(m : Movie) -> Bool in
            return scope == "Title" && m.title.rangeOfString(searchText) != nil
        })
    }
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchString searchString: String?) -> Bool {
        self.filterContentForSearchText(searchString!,scope:"Title")
        return true
    }
    func searchDisplayController(controller: UISearchDisplayController, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
        self.filterContentForSearchText(self.searchDisplayController!.searchBar.text!,scope:"Title")
        return true
    }
    func searchBar(_ searchBar: UISearchBar,
        textDidChange searchText: String){
            print("asdf")
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
        print("eenndd")
    }
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        print(searchBar.text)
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let movieDetailViewController = segue.destinationViewController as! MovieDetailController
        let indexPath = self.tableView.indexPathForSelectedRow!
        movieDetailViewController.mvId=movieList[indexPath.row].id
    }
    

}
