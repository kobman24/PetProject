

import UIKit
import CoreData
import UserNotifications





class AddBDViewController: UIViewController {
    @IBOutlet var firstNameTextField:UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var birthdatePicker: UIDatePicker!
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var botView: UIView!
    
    @IBOutlet weak var midView: UIView!
    @IBOutlet weak var topStaticLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
       
        
        navigationItem.hidesBackButton = true
        // скрыл кнопку назад в баре навигации , т.k. кнопка выйти уже реализовна
        birthdatePicker.maximumDate = Date()
        topView.backgroundColor = .red
        midView.backgroundColor = .orange
        botView.backgroundColor = .yellow
       
        topStaticLabel.backgroundColor = .purple
        topStaticLabel.textColor = .white
        topStaticLabel.layer.masksToBounds = true
        topStaticLabel.layer.cornerRadius = 10
        
    }
    
    
    @IBAction func pressForSave(_ sender: UIButton) {
        let firstName = firstNameTextField.text ?? ""
        let lastname = lastNameTextField.text ?? ""
        let birthdate = birthdatePicker.date
        guard let appdelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appdelegate.persistentContainer.viewContext
        let newBirthday = Birthday(context: context)
        newBirthday.firstName = firstName
        newBirthday.lastName = lastname
        newBirthday.birthDate = birthdate
        newBirthday.birthdayId = UUID().uuidString
        
        do {
            try context.save()
            let message = "Cегодня\(firstName) \(lastname) празднует день рождения!!! не забудьте поздавить)"
            let content = UNMutableNotificationContent()
            content.body = message
            content.sound = UNNotificationSound.default
            var dateComponents = Calendar.current.dateComponents([.month,.day], from: birthdate)
            dateComponents.hour = 10
            dateComponents.minute = 10
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            if let identifier = newBirthday.birthdayId {
                let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
                let center = UNUserNotificationCenter.current()
                center.add(request)
            }
        } catch let error {
            print("не удалось сохранить данные изза ошибкиё\(error)")
        }
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func pressForCancel(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}







