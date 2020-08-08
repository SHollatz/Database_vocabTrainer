-- MySQL Workbench Synchronization
-- Generated: 2020-08-07 14:39
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Saholly

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`users` (
  `users_id` INT(11) NOT NULL AUTO_INCREMENT,
  `users_name` VARCHAR(255) NOT NULL,
  `users_pwd` VARCHAR(255) NULL DEFAULT NULL,
  `users_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `users_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`users_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`uncheckedWords` (
  `uncheckedWords_id` INT(11) NOT NULL AUTO_INCREMENT,
  `uncheckedWords_word` VARCHAR(255) NOT NULL,
  `uncheckedWords_person` ENUM('1', '2', '3') NULL DEFAULT NULL COMMENT 'Possible values:\n1 = 1st person\n2 = 2nd person\n3 = 3rd person',
  `uncheckedWords_grammaticalNumber` ENUM('S', 'P') NULL DEFAULT NULL COMMENT 'Possible values:\nS = Singular\nP = Plural',
  `uncheckedWords_gender` ENUM('F', 'M', 'N') NULL DEFAULT NULL COMMENT 'Possible values:\nF = Female\nM = Male\nN = Neuter',
  `uncheckedWords_case` ENUM('N', 'A', 'D', 'G') NULL DEFAULT NULL COMMENT 'Possible values:\nN = Nominative\nA = Accusative\nD = Dative\nG = Genitive',
  `uncheckedWords_article` VARCHAR(20) NULL DEFAULT NULL,
  `uncheckedWords_preposition` VARCHAR(20) NULL DEFAULT NULL,
  `uncheckedWords_verbStrength` ENUM('weak', 'strong', 'irregular') NULL DEFAULT NULL,
  `uncheckedWords_tense` VARCHAR(255) NULL DEFAULT NULL,
  `uncheckedWords_verbSeparability` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\n1 = True',
  `uncheckedWords_comparitive` VARCHAR(255) NULL DEFAULT NULL,
  `uncheckedWords_superlative` VARCHAR(255) NULL DEFAULT NULL,
  `uncheckedWords_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `uncheckedWords_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`uncheckedWords_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`words` (
  `words_id` INT(11) NOT NULL AUTO_INCREMENT,
  `words_word` VARCHAR(255) NOT NULL,
  `words_englishTranslation` VARCHAR(255) NOT NULL,
  `words_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `words_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`words_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`roots` (
  `roots_WordsID` INT(11) NOT NULL AUTO_INCREMENT,
  `roots_root` VARCHAR(255) NOT NULL,
  `roots_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `roots_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`roots_WordsID`, `roots_root`),
  CONSTRAINT `fk_roots_words1`
    FOREIGN KEY (`roots_WordsID`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`nouns` (
  `nouns_wordID` INT(11) NOT NULL,
  `nouns_noun` VARCHAR(255) NOT NULL,
  `nouns_grammaticalNumber` ENUM('S', 'P') NULL DEFAULT NULL COMMENT 'Possible values:\nS = Singular\nP = Plural',
  `nouns_gender` ENUM('F', 'M', 'N') NULL DEFAULT NULL COMMENT 'Possible values:\nF = Female\nM = Male\nN = Neuter',
  `nouns_nominative` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\nN = Nominative\nA = Accusative\nD = Dative\nG = Genitive',
  `nouns_accusative` TINYINT(4) NULL DEFAULT NULL,
  `nouns_dative` TINYINT(4) NULL DEFAULT NULL,
  `nouns_genitive` TINYINT(4) NULL DEFAULT NULL,
  `nouns_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `nouns_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`nouns_noun`),
  CONSTRAINT `fk_nouns_words1`
    FOREIGN KEY (`nouns_wordID`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`verbs` (
  `verbs_wordsID` INT(11) NOT NULL,
  `verbs_verb` VARCHAR(255) NOT NULL,
  `verbs_person` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Possible values:\n1 = 1st Person\n2 = 2nd Person\n3 = 3rd Person',
  `verbs_grammaticalNumber` ENUM('S', 'P') NULL DEFAULT NULL COMMENT 'Possible values:\nS = Singular\nP = Plural',
  `verbs_simplePresent` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\n1 = True',
  `verbs_simplePast` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\n1 = True',
  `verbs_pastPerfect` VARCHAR(255) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\n1 = True',
  `verbs_strength` ENUM('W', 'S', 'I') NULL DEFAULT NULL COMMENT 'Possible values:\nW = weak\nS = strong\nI = irregular',
  `verbs_separability` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\n1 = True',
  `verbs_preposition` VARCHAR(20) NULL DEFAULT NULL,
  `verbs_reflexive` ENUM('0', 'A', 'D') NULL DEFAULT NULL COMMENT 'Possible values:\n0 = False\nA = Accusative\nD = Dative',
  `verbs_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `verbs_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_verbs_words1`
    FOREIGN KEY (`verbs_wordsID`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`adjectives` (
  `adjectives_wordsID` INT(11) NOT NULL,
  `adjectives_adjective` VARCHAR(255) NOT NULL,
  `adjectives_grammaticalNumber` ENUM('S', 'P') NULL DEFAULT NULL COMMENT 'Possible values:\nS = Singular\nP = Plural',
  `adjectives_female` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_male` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_neuter` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_case` ENUM('N', 'A', 'D', 'G') NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_comparitive` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_superlative` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_withDefiniteArticle` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_withIndefiniteArticle` TINYINT(4) NULL DEFAULT NULL COMMENT 'Possible values:\n0 = True\n1 = False',
  `adjectives_withoutArticle` VARCHAR(255) NULL DEFAULT NULL,
  `adjectives_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `adjectives_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_adjectives_words1`
    FOREIGN KEY (`adjectives_wordsID`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`personalPronouns` (
  `personalPronouns_wordsID` INT(11) NOT NULL,
  `personalPronouns_pronoun` VARCHAR(255) NOT NULL,
  `personalPronouns_case` ENUM('N', 'A', 'D') NULL DEFAULT NULL COMMENT 'Possible values:\nN = Nominative\nA = Accusative\nD = Dative\n',
  `personalPronouns_gender` ENUM('F', 'M', 'N') NULL DEFAULT NULL COMMENT 'Possible values:\nF = Female\nM = Male\nN = Neuter',
  `personalPronouns_grammaticalNumber` VARCHAR(255) NULL DEFAULT NULL,
  `personalPronouns_person` ENUM('1', '2', '3') NULL DEFAULT NULL,
  `personalPronouns_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `personalPronouns_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT `fk_personalPronouns_words1`
    FOREIGN KEY (`personalPronouns_wordsID`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`definiteArticles` (
  `definiteArticles_id` INT(11) NOT NULL AUTO_INCREMENT,
  `definiteArticles_article` VARCHAR(20) NULL DEFAULT NULL,
  `definiteArticles_gender` ENUM('F', 'M', 'N') NULL DEFAULT NULL COMMENT 'Possible values:\nF = Female\nM = Male\nN = Neuter',
  `definiteArticles_case` ENUM('N', 'A', 'D', 'G') NULL DEFAULT NULL,
  `definiteArticles_grammaticalNumber` ENUM('S', 'P') NULL DEFAULT NULL,
  `definiteArticles_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `definiteArticles_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nouns_nouns_id` INT(11) NOT NULL,
  PRIMARY KEY (`definiteArticles_id`, `nouns_nouns_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`indefiniteArticles` (
  `indefiniteArticles_id` INT(11) NOT NULL AUTO_INCREMENT,
  `indefiniteArticles_article` VARCHAR(20) NOT NULL,
  `indefiniteArticles_gender` ENUM('F', 'M', 'N') NULL DEFAULT NULL COMMENT 'Possible values:\nF = Female\nM = Male\nN = Neuter',
  `indefiniteArticles_case` ENUM('N', 'A', 'D', 'G') NULL DEFAULT NULL COMMENT 'Possible values:\nN = Nominative\nA = Accusative\nD = Dative\nG = Genitive',
  `indefiniteArticles_created` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `indefiniteArticles_modified` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `nouns_nouns_id` INT(11) NOT NULL,
  PRIMARY KEY (`indefiniteArticles_id`, `nouns_nouns_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `vocabTrainer`.`inputs` (
  `uncheckedWords_uncheckedWords_id` INT(11) NOT NULL,
  `users_users_id` INT(11) NOT NULL,
  PRIMARY KEY (`uncheckedWords_uncheckedWords_id`, `users_users_id`),
  CONSTRAINT `fk_uW_has_users_uW1`
    FOREIGN KEY (`uncheckedWords_uncheckedWords_id`)
    REFERENCES `vocabTrainer`.`uncheckedWords` (`uncheckedWords_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_uW_has_users_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `vocabTrainer`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS `vocabTrainer`.`worksWith` (
  `users_users_id` INT(11) NOT NULL,
  `words_words_id` INT(11) NOT NULL,
  PRIMARY KEY (`users_users_id`, `words_words_id`),
  CONSTRAINT `fk_users_has_words_users1`
    FOREIGN KEY (`users_users_id`)
    REFERENCES `vocabTrainer`.`users` (`users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_users_has_words_words1`
    FOREIGN KEY (`words_words_id`)
    REFERENCES `vocabTrainer`.`words` (`words_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

