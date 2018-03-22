(ns example-clj.core
  (:gen-class)
  (:require [clojure.string :as str]))

(def leaves (slurp "leaves.txt"))

(defn wordCount [content]
  (->>
    (str/split content #"[\s.,\/:\n]+")
    frequencies
    (sort-by val >)
    (take 10)))

(defn -main
  "Get the word count of a file"
  [& args]
  (println (wordCount leaves)))
