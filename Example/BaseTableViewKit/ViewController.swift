//
//  ViewController.swift
//  BaseTableViewKit
//
//  Created by viacheslavplatonov on 02/08/2022.
//  Copyright (c) 2022 viacheslavplatonov. All rights reserved.
//

import UIKit
import BaseTableViewKit

class ViewController: UIViewController {

    private let mainView = MainView(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        makeState()
    }

    private func makeState() {
        // first section
        let firstRowOfFirstSection = MainView.ViewState.Row(
            title: "First row of first section",
            leftImage: UIImage(systemName: "bag"),
            separator: true,
            onSelect: {
            print("selected first row of first section")
        },
            backgroundColor: .clear)
        
        let secondRowOfFirstSection = MainView.ViewState.Row(
            title: "Second row of first section",
            leftImage: UIImage(systemName: "creditcard"),
            separator: true,
            onSelect: {
                print("selected second row of first section")
            },
            backgroundColor: .clear)
        
        let thirdRowOfFirstSection = MainView.ViewState.Row(
            title: "Third row of first section",
            leftImage: UIImage(systemName: "banknote"),
            separator: true,
            onSelect: {
                print("selected third row of first section")
            },
            backgroundColor: .clear)
        
        let firstSectionHeader = MainView.ViewState.Header(
            title: "First section",
            style: .medium,
            backgroundColor: .clear,
            isInsetGrouped: false)

        let firstSection = SectionState(header: firstSectionHeader, footer: nil)

        let firstSectionElements: [Element] = [firstRowOfFirstSection, secondRowOfFirstSection, thirdRowOfFirstSection].map { Element(content: $0) }
        
        let firstBlock = State(model: firstSection, elements: firstSectionElements)



        // second section
        let firstRowOfSecondSection = MainView.ViewState.Row(
            title: "First row of second section",
            leftImage: UIImage.init(systemName: "heart.text.square"),
            separator: true,
            onSelect: {
                print("selected first row of second section")
            },
            backgroundColor: .clear)

        let secondRowOfSecondSection = MainView.ViewState.Row(
            title: "Second row of second section",
            leftImage: UIImage.init(systemName: "bolt.heart"),
            separator: true,
            onSelect: {
                print("selected second row of second section")
            },
            backgroundColor: .clear)
        
        let secondSectionHeader = MainView.ViewState.Header(
            title: "Second section",
            style: .medium,
            backgroundColor: .clear,
            isInsetGrouped: false)
        
        let secondSection = SectionState(header: secondSectionHeader, footer: nil)
        
        let secondSectionElements: [Element] = [firstRowOfSecondSection, secondRowOfSecondSection].map { Element(content: $0) }

        let secondBlock = State(model: secondSection, elements: secondSectionElements)


        // third section
        let firstRowOfThirdSection = MainView.ViewState.Row(
            title: "First row of third section",
            leftImage: UIImage.init(systemName: "questionmark.square"),
            separator: true,
            onSelect: {
            print("selected first row of third section")
        },
            backgroundColor: .clear)
                
        let thirdSectionHeader = MainView.ViewState.Header(
            title: "Third section",
            style: .medium,
            backgroundColor: .clear,
            isInsetGrouped: false)
        
        let thirdSectionFooter = MainView.ViewState.Footer(
            text: "🔥 FOOTER 🔥",
            attributedText: nil,
            isInsetGrouped: true)

        let thirdSection = SectionState(header: thirdSectionHeader, footer: thirdSectionFooter)
        
        let thirdSectionElements = Element(content: firstRowOfThirdSection)
        
        let thirdBlock = State(model: thirdSection, elements: [thirdSectionElements])
        
        mainView.table.viewStateInput = [firstBlock, secondBlock, thirdBlock]
    }

}


