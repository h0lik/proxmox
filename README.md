## 

#### Roles Ansible 
Ansible Role для создания виртуальных машинх из шаблонов 
структура:
```bash 
.
├── README.md
├── defaults
│   └── main.yml
├── files
├── handlers
│   └── main.yml
├── meta
│   └── main.yml
├── tasks
│   ├── clonevm.yml
│   ├── configurevm.yml
│   ├── main.yml
│   └── startvm.yml
├── templates
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    └── main.yml

9 directories, 11 files
```
##### Редактрируем переменные 
##### Первое это данные для подключения
**user:** Тут вписываем пользователя от которого будут создны виртуальная машина!\
**secret:** Пароль от вашего пользователя (Данную роль писал для HomeLab в проде надо использовать Vaults)\
**hosts:** Соббственно тут адресс вашего Proxmox\
##### Данные для клонирования и конфигурации новой вм\
**pvenode:** Название вашеф ноды на которой будет создана VM\
**vmid:** ID ВМ которая у вас сохранена как шаблон (Статья о шаблонах будет позде)\
**stg:** Хранилище куда будет склонирована ВМ\
**template:** Имя вашего шаблона\
**name_vm:** Имя вашей новой виртуальной мащины\
**new_id:** ID новой машины\
**cpu:** Число ядер\
**socket:** Сокеты обычно 1\
**mem:** Оперативная память\
##### Теперь пойдут настройки cloud-init\
**sshkey:** SSH ключ\
**address:** Айпи адресс формата 0.0.0.0/24\
**gateway:** Шлюз\
**nameserver:** DNS сервер\
**hostname:** Имя вирутуалки\
**users:** Имя юзера\
**passwd:** Пароль в проде использовать с (Vaults)\
 