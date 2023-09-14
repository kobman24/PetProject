
import CoreData
import UIKit
import UserNotifications

class BirthdayTableViewController: UITableViewController {
    var birthdays = [Birthday]()
    let dateFormatter = DateFormatter()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .none
        tableView.backgroundColor = .yellow
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appdelegate.persistentContainer.viewContext
        let fetchRequest = Birthday.fetchRequest() as NSFetchRequest<Birthday>
        let sortForLastName = NSSortDescriptor(key: "lastName", ascending: true)
        let sortForFirstName = NSSortDescriptor(key: "firstName", ascending: true)
        fetchRequest.sortDescriptors = [sortForLastName, sortForFirstName]
        do{
            birthdays = try context.fetch(fetchRequest)
        }catch let error {
            print("Не удалось загрузить данные из-за ошибки: \(error).")
            
        }
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return birthdays.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "birthdayCellIdentifier", for: indexPath)
        
        let birthday = birthdays[indexPath.row]
        let firstname = birthday.firstName ?? " "
        let lastname = birthday.lastName ?? " "
        cell.textLabel?.text = firstname + " " + lastname
        
        if let date = birthday.birthDate as Date? {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
            
        } else {
            cell.detailTextLabel?.text = " "
        }
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if birthdays.count > indexPath.row {
            let birthday = birthdays[indexPath.row]
            if let identifier = birthday.birthdayId {
                let center = UNUserNotificationCenter.current()
                center.removePendingNotificationRequests(withIdentifiers: [identifier])
            }
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
            let context = appDelegate.persistentContainer.viewContext
            context.delete(birthday)
            birthdays.remove(at: indexPath.row)
            do{
              try context.save()
            } catch let error {
                print("не удалось сохранить изменения из-за ошибки \(error)")
            }
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
       
        }
    
    
    
    
    @IBAction func pressedForAddView(_ sender: UIBarButtonItem) {
        guard let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddBDViewController") as? AddBDViewController else {return}
        self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    
}
