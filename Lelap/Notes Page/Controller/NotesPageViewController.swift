//
//  NotesPageViewController.swift
//  Lelap
//
//  Created by Dion Lamilga on 03/05/21.
//

import UIKit

class NotesPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableNote: UITableView!
    
   // var models: [(title: String, note: String)] = []
    
    var models2 = [Datas]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableNote.delegate = self
        tableNote.dataSource = self
        // Do any additional setup after loading the view.
        //navigationItem.largeTitleDisplayMode = .always
        
        let defaults = UserDefaults.standard
        if let saveModels = defaults.object(forKey: "models2") as? Data{
            let jsonDecoder = JSONDecoder()
            do{
                models2 = try jsonDecoder.decode([Datas].self, from: saveModels)
            } catch {
                print("fail")
            }
        }
    }
    
    @IBAction func didTapNewNote(){
        guard let vc = storyboard?.instantiateViewController(identifier: "new") as? NewViewController else{
            return
        }
        vc.title = "New Journal"
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.completion = { noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            let word = Datas(title: noteTitle, content: note)
            self.models2.append(word)
            self.save()
           // self.models.append((title: noteTitle, note: note))
            self.tableNote.reloadData()
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableNote.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let titleText = models2[indexPath.row]
        cell.textLabel?.text = titleText.title
        cell.detailTextLabel?.text = titleText.content
      //  cell.textLabel?.text = models[indexPath.row].title
       // cell.detailTextLabel?.text = models[indexPath.row].note
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableNote.deselectRow(at: indexPath, animated: true)
        
        let model = models2[indexPath.row]
        
        guard let vc = storyboard?.instantiateViewController(identifier: "read") as? ReadViewController else{
            return
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        vc.title = "Journal"
        vc.noteTitle = model.title
        vc.note = model.content
//        vc.noteTitle = model.title
//        vc.note = model.note
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func save(){
        let jsonEncoder = JSONEncoder()
        if let saveData = try? jsonEncoder.encode(models2){
            let defaults = UserDefaults.standard
            defaults.set(saveData, forKey: "models2")
        } else {
            print("fail")
        }
    }
}
