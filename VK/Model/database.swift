//
//  database.swift
//  VK
//
//  Created by пользовтель on 07.03.2021.
//

import UIKit

struct VKUser {
    let fio: String
    let friendAvatar: UIImage
    let userPhoto: [UIImage]
}
struct VKGroup {
    let groupName: String
    let groupAvatar: UIImage
}
struct VKNews {
    let newsText: String
    let newsPhoto: UIImage
}
let users: [VKUser] =
    [ VKUser (fio: "Бэтмен",
              friendAvatar: UIImage (named: "icons8-batman-40")!,
              userPhoto:
                [UIImage (named: "batman1")!,
                 UIImage (named: "batman2")!,
                 UIImage (named: "batman3")!]),
      VKUser (fio: "Железный человек",
              friendAvatar: UIImage (named: "icons8-iron-man-40")!,
              userPhoto:
                [UIImage (named: "ironman1")!,
                 UIImage (named: "ironman2")!,
                 UIImage (named: "ironman3")!]),
      VKUser (fio: "Буратино",
                friendAvatar: UIImage (named: "icons8-batman-40")!,
                userPhoto:
                  [UIImage (named: "batman1")!,
                   UIImage (named: "batman2")!,
                   UIImage (named: "batman3")!]),
      VKUser (fio: "Тор",
              friendAvatar: UIImage (named: "icons8-thor-40")!,
              userPhoto:
                [UIImage (named: "thor1")!,
                 UIImage (named: "thor2")!,
                 UIImage (named: "thor3")!]),
      VKUser (fio: "Человек-паук",
              friendAvatar: UIImage (named: "icons8-spider-man-head-40")!,
              userPhoto:
                [UIImage (named: "spider1")!,
                 UIImage (named: "spider2")!,
                 UIImage (named: "spider3")!]),
      VKUser (fio: "Веном",
              friendAvatar: UIImage (named: "icons8-venom-head-40")!,
              userPhoto:
                [UIImage (named: "venom1")!,
                 UIImage (named: "venom2")!,
                 UIImage (named: "venom3")!]),
      VKUser (fio: "Доктор Кто",
              friendAvatar: UIImage (named: "icons8-venom-head-40")!,
              userPhoto:
                [UIImage (named: "venom1")!,
                 UIImage (named: "venom2")!,
                 UIImage (named: "venom3")!]),
      VKUser (fio: "Локи",
              friendAvatar: UIImage (named: "icons8-venom-head-40")!,
              userPhoto:
                [UIImage (named: "venom1")!,
                 UIImage (named: "venom2")!,
                 UIImage (named: "venom3")!])]
//var mygroup: [VKGroup] = []
var globalGroup: [VKGroup] =
    [VKGroup (groupName: "Спорт", groupAvatar: UIImage (named: "sport")!),
     VKGroup (groupName: "Рыбалка", groupAvatar: UIImage (named: "fishing")!),
     VKGroup (groupName: "Иностранные языки", groupAvatar: UIImage (named: "foregn")!),
     VKGroup (groupName: "Программирование", groupAvatar: UIImage (named: "programming")!),
     VKGroup (groupName: "Книги", groupAvatar: UIImage (named: "books")!),
     VKGroup (groupName: "Фильмы", groupAvatar: UIImage (named: "films")!)]
var myNews: [VKNews] = [
    VKNews (newsText: "У чиcтoтeлa ecть oднa oчeнь интepecнaя ocoбeннocть. Он cpaзу oтыcкивaeт кopeнь бoлeзни. Εcли coк или пopoшoк пoмecтить нa биoлoгичecки aктивную тoчку, тo нaблюдaeтcя мгнoвeннaя тpaнcфopмaция, пepeнoc eгo к иcтoчнику бoлeзни. ", newsPhoto: UIImage (named: "news1")!),
    VKNews (newsText: "Не хочешь тромбов, просто пей этот коктейль.Народная медицина предлагает универсальный коктейль от многих заболеваний. Нужно смешать в одной бутылке (желательно тёмного стекла) аптечные настойки: по 100 мл. пустырника, • валерианы, • боярышника, • пиона уклоняющегося, • 50 мл. листа эвкалипта и • 25 мл. травы мяты перечной", newsPhoto: UIImage (named: "news2")!)]
