namespace java edu.jhu.hlt.concrete
namespace py concrete.situations
#@namespace scala edu.jhu.hlt.miser

include "structure.thrift"
include "metadata.thrift"

/** 
 * A situation argument, consisting of an argument role and a value.
 * Argument values may be Entities or Situations. 
 */
struct Argument {
  /** 
   * The relationship between this argument and the situation that
   * owns it. The roles that a situation's arguments can take
   * depend on the type of the situation (including subtype
   * information, such as event_type). 
   */
  1: optional string role

  /** 
   * A pointer to the value of this argument, if it is explicitly
   * encoded as an Entity.
   */
  2: optional string entityId

  /**
   * A pointer to the value of this argument, if it is a situation.
   */
  3: optional string situationId
  
  /** 
   * New roles should usually be added to the enum, but for use
   * cases with many varied and possibly dynamic role names, this can be
   * used. Presumably this would only be used in a prototype stage of an
   * analytic, with roles eventually "hardening" and moving to the enum. 
   */
  4: optional string roleLabel
}

struct Justification {
  /** 
   * An enumerated value used to describe the way in which the
   * justification's mention provides supporting evidence for the
   * situation. 
   */
  1: optional string justificationType

  /** 
   * A pointer to the SituationMention itself. 
   */
  2: required string mentionId

  /** 
   * An optional list of pointers to tokens that are (especially)
   * relevant to the way in which this mention provides
   * justification for the situation. It is left up to individual
   * analytics to decide what tokens (if any) they wish to include
   * in this field. 
   */
  3: optional list<structure.TokenRefSequence> tokens
}

//===========================================================================
// Situations
//===========================================================================

/** 
 * A single situation, along with pointers to situation mentions that
 * provide evidence for the situation. "Situations" include events,
 * relations, facts, sentiments, and beliefs. Each situation has a
 * core type (such as EVENT or SENTIMENT), along with an optional
 * subtype based on its core type (e.g., event_type=CONTACT_MEET), and
 * a set of zero or more unordered arguments. 
 */

struct Situation {
  /** 
   * Unique identifier for this situation. 
   */
  1: required string uuid

  /** 
   * The core type of this situation (eg EVENT or SENTIMENT).
   */
  2: required string situationType

  /** 
   * The arguments for this situation. Each argument consists of a
   * role and a value. It is possible for an situation to have
   * multiple arguments with the same role. Arguments are
   * unordered. 
   */
  3: optional list<Argument> argumentList

  /** 
   * Ids of the mentions of this situation in a communication
   * (type=SituationMention) 
   */
  4: optional list<string> mentionIdList

  /** 
   * An list of pointers to SituationMentions that provide
   * justification for this situation. These mentions may be either
   * direct mentions of the situation, or indirect evidence. 
   */
  5: optional list<Justification> justificationList

  /** 
   * The event type for situations where situation_type=EVENT 
   */
  50: optional string eventType

  /** 
   * The state type for situations where situation_type=STATE 
   */
  51: optional string stateType
  
  /** 
   * The temporal fact type for situations where situation_type=TEMPORAL_FACT 
   */
  52: optional string temporalFactType
  
  /** 
   * This lemma represents a canonical lemma for the situation kind
   * when the situation kind cannot be specified by a situation type subtype
   * (ex, when using arbitrary verbs or nominalizations as events which do
   * not appear in the event_type enumeration).
   * If this kind is grounded in a token sequence from the original text, the
   * appropriate SituationMention should have a reference to the token sequence.
   */
  53: optional string situationKindLemma
  
  /** 
   * The TimeML class for situations representing TimeML events 
   */
  54: optional string timemlClass
  
  /** 
   * The TimeML tense for situations representing TimeML events 
   */
  55: optional string timemlTense
  
  /** 
   * The TimeML aspect for situations representing TimeML events 
   */
  56: optional string timemlAspect

  /** 
   * An "intensity" rating for this situation, typically ranging from
   * 0-1. In the case of SENTIMENT situations, this is used to record
   * the intensity of the sentiment. 
   */
  100: optional double intensity

  /** 
   * The polarity of this situation. In the case of SENTIMENT
   * situations, this is used to record the polarity of the
   * sentiment. 
   */
  101: optional string polarity

  /** 
   * A confidence score for this individual situation. You can also
   * set a confidence score for an entire SituationSet using the
   * SituationSet's metadata. 
   */
  200: optional double confidence
}

/** 
 * A theory about the set of situations that are present in a
 * message. See also: Situation 
 */
struct SituationSet {
  /** 
   * Unique identifier for this set. 
   */
  1: required string uuid

  /** 
   * Information about where this set came from. 
   */
  2: optional metadata.AnnotationMetadata metadata

  /** 
   * List of mentions in this set. 
   */
  3: required list<Situation> situationList
}

/**
 * A "concrete" argument, that may be used by SituationMentions or EntityMentions
 * to avoid conflicts where abstract Arguments were being used to support concrete Mentions.
 */
struct MentionArgument {
  /** 
   * The relationship between this argument and the situation that
   * owns it. The roles that a situation's arguments can take
   * depend on the type of the situation (including subtype
   * information, such as event_type). 
   */
  1: optional string role

  /** 
   * A pointer to the value of an EntityMention, if this is being used to support
   * an EntityMention.
   */
  2: optional string entityMentionId

  /**
   * A pointer to the value of this argument, if it is a SituationMention.
   */
  3: optional string situationMentionId
  
  /** 
   * New roles should usually be added to the enum, but for use
   * cases with many varied and possibly dynamic role names, this can be
   * used. Presumably this would only be used in a prototype stage of an
   * analytic, with roles eventually "hardening" and moving to the enum. 
   */
  4: optional string roleLabel
}

//===========================================================================
// Situation Mentions
//===========================================================================

/** 
 * A concrete mention of a situation, where "situations" include
 * events, relations, facts, sentiments, and beliefs. Each situation
 * has a core type (such as EVENT or SENTIMENT), along with an
 * optional subtype based on its core type (e.g.,
 * event_type=CONTACT_MEET), and a set of zero or more unordered
 * arguments. 
 */
struct SituationMention {
  /** 
   * Unique identifier for this situation. 
   */
  1: required string uuid

  /** 
   * The text content of this situation mention. This field is
   * often redundant with the 'tokens' field, and may not
   * be generated by all analytics. 
   */
  2: optional string text

  /** 
   * The core type of this situation (eg EVENT or SENTIMENT) 
   */
  3: optional string situationType

  /** 
   * The arguments for this situation mention. Each argument
   * consists of a role and a value. It is possible for an situation
   * to have multiple arguments with the same role. Arguments are
   * unordered. 
   */
  4: required list<MentionArgument> argumentList

  /** 
   * The event type for situations where situation_type=EVENT 
   */
  50: optional string eventType

  /** 
   * The state type for situations where situation_type=STATE 
   */
  51: optional string stateType
  
  /** 
   * This lemma represents a canonical lemma for the situation kind
   * when the situation kind cannot be specified by a situation type subtype
   * (ex, when using arbitrary verbs or nominalizations as events which do
   * not appear in the event_type enumeration).
   * If this kind is grounded in a token sequence from the original text, the
   * SituationMention should have a reference to the token sequence.
   */
  53: optional string situationKindLemma

  /** 
   * An "intensity" rating for the situation, typically ranging from
   * 0-1. In the case of SENTIMENT situations, this is used to record
   * the intensity of the sentiment. 
   */
  100: optional double intensity

  /** 
   * The polarity of this situation. In the case of SENTIMENT
   * situations, this is used to record the polarity of the
   * sentiment. 
   */
  101: optional string polarity

  /** 
   * An optional pointer to tokens that are (especially)
   * relevant to this situation mention. It is left up to individual
   * analytics to decide what tokens (if any) they wish to include in
   * this field. In particular, it is not specified whether the
   * arguments' tokens should be included. 
   */
  150: optional structure.TokenRefSequence tokens

  /** 
   * A confidence score for this individual situation mention. You
   * can also set a confidence score for an entire SituationMentionSet
   * using the SituationMentionSet's metadata. 
   */
  200: optional double confidence
}

/** 
 * A theory about the set of situation mentions that are present in a
 * message. See also: SituationMention 
 */
struct SituationMentionSet {
  /** 
   * Unique identifier for this set. 
   */
  1: required string uuid

  /** 
   * Information about where this set came from. 
   */
  2: optional metadata.AnnotationMetadata metadata

  /** 
   * List of mentions in this set. 
   */
  3: required list<SituationMention> mentionList
}
