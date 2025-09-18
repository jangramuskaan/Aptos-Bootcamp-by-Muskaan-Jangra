module MyModule::PeerRecognition {
    use aptos_framework::signer;
    use aptos_framework::timestamp;
    use std::string::{Self, String};
    use std::vector;

    /// Struct representing a recognition NFT reward.
    struct RecognitionNFT has store, key {
        recipient: address,        // Address of the person being recognized
        recognizer: address,       // Address of the person giving recognition
        category: String,          // Type of recognition (e.g., "Leadership", "Innovation")
        message: String,           // Recognition message
        timestamp: u64,            // When the recognition was given
        nft_id: u64,              // Unique NFT identifier
    }

    /// Struct to track recognition statistics for each user.
    struct RecognitionProfile has store, key {
        total_received: u64,       // Total recognitions received
        total_given: u64,         // Total recognitions given
        nft_collection: vector<u64>, // List of NFT IDs owned
    }

    /// Function to give recognition to a peer and mint an NFT reward.
    public fun give_recognition(
        recognizer: &signer,
        recipient_address: address,
        category: String,
        message: String,
        nft_id: u64
    ) acquires RecognitionProfile {
        let recognizer_addr = signer::address_of(recognizer);
        
        // Create the recognition NFT
        let recognition_nft = RecognitionNFT {
            recipient: recipient_address,
            recognizer: recognizer_addr,
            category,
            message,
            timestamp: timestamp::now_seconds(),
            nft_id,
        };
        
        // Move NFT to recipient
        move_to(recognizer, recognition_nft);
        
        // Update profiles
        if (!exists<RecognitionProfile>(recipient_address)) {
            let profile = RecognitionProfile {
                total_received: 1,
                total_given: 0,
                nft_collection: vector::singleton(nft_id),
            };
            move_to(recognizer, profile);
        } else {
            let recipient_profile = borrow_global_mut<RecognitionProfile>(recipient_address);
            recipient_profile.total_received = recipient_profile.total_received + 1;
            vector::push_back(&mut recipient_profile.nft_collection, nft_id);
        };
    }

    /// Function to initialize a user's recognition profile.
    public fun create_profile(user: &signer) {
        let profile = RecognitionProfile {
            total_received: 0,
            total_given: 0,
            nft_collection: vector::empty<u64>(),
        };
        move_to(user, profile);
    }
}