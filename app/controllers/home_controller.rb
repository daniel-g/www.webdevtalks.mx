require 'ostruct'

class HomeController < ApplicationController
  helper_method :speakers

  def index
  end

  private

  def speakers
    [
      {
        avatar_url: 'nacho.jpeg',
        speech_title: 'GoLang',
        name: 'Ignacio Galindo',
        social_name: 'joiggama',
      },
      {
        avatar_url: 'alex.jpeg',
        speech_title: 'PHP',
        name: 'Alejandro Espinoza',
        social_name: 'alexesba',
      },
      {
        avatar_url: 'cone.jpeg',
        speech_title: 'Java',
        name: 'Carlos Gutierrez',
        social_name: 'cone'
      },
      {
        avatar_url: 'jona.jpeg',
        speech_title: 'Javascript',
        name: 'Jonatan Juarez',
        social_name: 'jonamx'
      },
      {
        avatar_url: 'pardinas.jpeg',
        speech_title: 'Ruby',
        name: 'Jorge Pardinas',
        social_name: 'jparbros'
      },
      {
        avatar_url: 'steven.jpeg',
        speech_title: 'Clojure',
        name: 'Steven Barragan',
        social_name: 'stevenbarragan'
      }
    ].map do |speaker|
      OpenStruct.new(speaker)
    end
  end
end
